import numpy as np
from functools import reduce
from scipy.optimize import minimize


def generate_Givens_rotation(i, j, theta, size):
    g = np.eye(size)
    c = np.cos(theta)
    s = np.sin(theta)
    g[i, i] = c
    g[j, j] = c
    if i > j:
        g[j, i] = -s
        g[i, j] = s
    elif i < j:
        g[j, i] = s
        g[i, j] = -s
    else:
        raise ValueError('i and j must be different')
    return g


def generate_Givens_rotation_gradient(i, j, theta, size):
    g = np.zeros((size, size))
    c = np.cos(theta)
    s = np.sin(theta)
    g[i, i] = -s
    g[j, j] = -s
    if i > j:
        g[j, i] = -c
        g[i, j] = c
    elif i < j:
        g[j, i] = c
        g[i, j] = -c
    else:
        raise ValueError('i and j must be different')
    return g


def generate_U_list(ij_list, theta_list, size):
    return [generate_Givens_rotation(ij[0], ij[1], theta, size)
            for ij, theta in zip(ij_list, theta_list)]


def generate_V_list(ij_list, theta_list, size):
    return [generate_Givens_rotation_gradient(ij[0], ij[1], theta, size)
            for ij, theta in zip(ij_list, theta_list)]


def get_U_ab(a, b, U_list, K):
    I = np.eye(U_list[0].shape[0])
    if a == b:
        if a < K and a != 0:
            return U_list[a]
        else:
            return I
    elif a > b:
        return I
    else:
        return reduce(np.dot, U_list[a:b], I)


def get_A_matrix(X, U_list, V_list, k, K):
    Ul = get_U_ab(0, k, U_list, K)
    V = V_list[k]
    Ur = get_U_ab(k + 1, K, U_list, K)
    return X.dot(Ul).dot(V).dot(Ur)


def get_rotation_matrix(X, C):
    ij_list = [(i, j) for i in range(C) for j in range(C) if i < j]
    K = len(ij_list)

    def cost_and_grad(theta_list):
        U_list = generate_U_list(ij_list, theta_list, C)
        V_list = generate_V_list(ij_list, theta_list, C)
        R = reduce(np.dot, U_list, np.eye(C))
        Z = X.dot(R)
        mi = np.argmax(Z, axis=1)
        M = np.choose(mi, Z.T).reshape(-1, 1)
        cost = np.sum((Z / M) ** 2)
        grad = np.zeros(K)
        for k in range(K):
            A = get_A_matrix(X, U_list, V_list, k, K)
            tmp = (Z / (M ** 2)) * A
            tmp -= ((Z ** 2) / (M ** 3)) * (np.choose(mi, A.T).reshape(-1, 1))
            tmp = 2 * np.sum(tmp)
            grad[k] = tmp

        return cost, grad

    theta_list_init = np.array([0.0] * int(C * (C - 1) / 2))
    opt = minimize(cost_and_grad,
                   x0=theta_list_init,
                   method='CG',
                   jac=True,
                   options={'disp': False})
    return opt.fun, reduce(np.dot, generate_U_list(ij_list, opt.x, C), np.eye(C))
