#!/usr/local/Cellar/python/2.7.6/bin/python
# -*- coding: utf-8 -*-

'''Standard python modules'''
import sys

'''For scientific computing'''
from numpy import *
import scipy

'''For plotting'''
from matplotlib import pyplot, cm
from mpl_toolkits.mplot3d import Axes3D

import random
import numpy as np
from numpy import linalg as LA
import matplotlib.pyplot as plt







def hypothesis(X, theta):
    """Hypothesis function for linear regression
    this should be inlined code, but it's here for clear representation purpsoes
    """
    return X.dot(theta)


def computeCostLoop(X, y, theta):
    """Compute cost but in the slower loop method, in order to show how the
    pre-vectorization algorithm initially works. Always start with loop version first
    and code the vectorized version later
    """
    m = len(y)  # or m = shape(y)[0], since y is 1D

    cumulative_sum = 0
    for i in range(0, m):
        cumulative_sum += (hypothesis(X[i], theta) - y[i]) ** 2
    cumulative_sum = (1.0 / (2 * m)) * cumulative_sum
    return cumulative_sum


def BayescomputeCost(X, y, theta):
    """Compute cost, vectorized version"""
    sigma = 0.1
    term = hypothesis(X, theta) - y
    # sum( term**2 ) in this case ~= term.T.dot( term )
    return ((term.T.dot(term)+theta.T.dot(theta)) / (2 * sigma**2))[0, 0]


def gradientDescentLoop(X, y, theta, alpha, iterations):
    """Gradient descent in loop version"""
    m 	 = len(y)
    n 	 = shape(X)[1]

    for counter in range(0, iterations):
        # create n number of cumulative inner sums
        cum_sum = [0 for x in range(0, n)] #range(0,n)==range(n)

        for j in range(0, n):
            for i in range(0, m):
                term 		= (hypothesis(X[i], grad) - y[i])
                cum_sum[j] += X[i, j] * (term)

        # assign new values for each gradient, this should be separate from the loop above
        # in order to achieve simulataneous update effect
        for j in range(0, n):
            grad[j] = grad[j] - cum_sum[j] * (alpha / m)

    return theta


def BayesgradientDescent(X, y, theta, alpha, iterations):
	sigma = 0.1
	for counter in range(0, iterations):
		inner_sum = X.T.dot(hypothesis(X, theta) - y)+ theta
        theta 	 = theta - alpha / sigma**2 * inner_sum 

	return theta

def LaplaceApprox(X, y, theta, c):
	1/(2*np.pi*sigma**2)**(N+1)*exp(-c*(theta-y))
	return laplace

def func():
	N = 100
	datax= [10*random.random() for i in range(N)]
	datax=np.array(datax)
	v=np.var(datax)
	linex=np.arange(0,10,0.1)
	sigma=1
	w0=random.random()
	w1=random.random()
	liney=[w0+w1*x for x in linex]
	y = [w0+w1*x for x in datax]
	y=np.array(y)
	t= [np.random.normal(mu,sigma) for mu in y]
	t=np.array(t)
	m 	 = len(t)
	t 	 = t.reshape(m, 1)
	X 			= c_[ones((m, 1)), datax] # c_ is useful for concatentation. Add a column of ones to X becomes (m+1,2) shaped
	theta 		= zeros((2, 1))
	iterations 	= 2000
	alpha 		= 0.001
	cost 	= BayescomputeCost(X, t, theta)  # should be 32.07
	theta 	= BayesgradientDescent(X, t, theta, alpha, iterations)
	
	
	c2=  2*(sum(datax)-1)
	
	print datax
	print theta
	print w0,w1

    #predict1 = array([1, 3.5]).dot(theta)
    #predict2 = array([1, 7]).dot(theta)
    #print predict1
    #print predict2

	plt.scatter(datax,t)
	pyplot.plot(X[:, 1], X.dot(theta), 'g-')
	pyplot.legend(['Linear regression','Train data'],loc='upper right')
	pyplot.show(block=True)
	
func()