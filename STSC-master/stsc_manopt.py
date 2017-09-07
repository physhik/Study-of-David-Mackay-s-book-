from autograd import numpy as npy
from pymanopt.manifolds import Stiefel
from pymanopt import Problem
from pymanopt.solvers import SteepestDescent


def get_rotation_matrix(X, C):
    def cost(R):
        Z = npy.dot(X, R)
        M = npy.max(Z, axis=1, keepdims=True)
        return npy.sum((Z / M) ** 2)

    manifold = Stiefel(C, C)
    problem = Problem(manifold=manifold, cost=cost, verbosity=0)
    solver = SteepestDescent(logverbosity=0)
    opt = solver.solve(problem=problem, x=npy.eye(C))
    return cost(opt), opt
