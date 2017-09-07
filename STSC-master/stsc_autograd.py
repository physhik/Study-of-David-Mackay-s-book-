from autograd import numpy as npy
from functools import reduce
from scipy.optimize import minimize
from autograd import grad


def generate_Givens_rotation(i, j, theta, size):
    g = npy.eye(size)
    c = npy.cos(theta)
    s = npy.sin(theta)
    g[i, i] = 0
    g[j, j] = 0
    g[j, i] = 0
    g[i, j] = 0
    ii_mat = npy.zeros_like(g)
    ii_mat[i, i] = 1
    jj_mat = npy.zeros_like(g)
    jj_mat[j, j] = 1
    ji_mat = npy.zeros_like(g)
    ji_mat[j, i] = 1
    ij_mat = npy.zeros_like(g)
    ij_mat[i, j] = 1
    return g + c * ii_mat + c * jj_mat + s * ji_mat - s * ij_mat


def generate_U_list(ij_list, theta_list, size):
    return [generate_Givens_rotation(ij[0], ij[1], theta, size)
            for ij, theta in zip(ij_list, theta_list)]


def get_rotation_matrix(X, C):
    ij_list = [(i, j) for i in range(C) for j in range(C) if i < j]

    def cost(theta_list):
        U_list = generate_U_list(ij_list, theta_list, C)
        R = reduce(npy.dot, U_list, npy.eye(C))
        Z = X.dot(R)
        M = npy.max(Z, axis=1, keepdims=True)
        return npy.sum((Z / M) ** 2)

    theta_list_init = npy.array([0.0] * int(C * (C - 1) / 2))
    opt = minimize(cost,
                   x0=theta_list_init,
                   method='CG',
                   jac=grad(cost),
                   options={'disp': False})
    return opt.fun, reduce(npy.dot, generate_U_list(ij_list, opt.x, C), npy.eye(C))
