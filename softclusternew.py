#!/usr/local/Cellar/python/2.7.6/bin/python
# -*- coding: utf-8 -*-

'''Standard python modules'''
import sys

'''For scientific computing'''
from numpy import *
import scipy.misc, scipy.io, scipy.optimize, scipy.cluster.vq

'''For plotting'''
from matplotlib import pyplot, cm, colors
from mpl_toolkits.mplot3d import Axes3D


import random
import numpy as np
from numpy import linalg as LA
import matplotlib.pyplot as plt
import math

N=100

data1=[[0.5+0.5*random.random(),0.5+0.5*random.random()] for i in range(N)]
data2=[[0.5*random.random(),0.5*random.random()] for i in range(N)]
	
data1=array(data1)
data2=array(data2)	

data = concatenate((data1,data2))

X=c_[data[:,0],data[:,1]]




def displaydata():
	pyplot.scatter(X[:,0],X[:,1])
	pyplot.show()
	



def findClosestCentroids( X, centroids ):
	K 	= shape( centroids )[0]
	m   = shape( X )[0]
	idx = zeros( (m, 1) )
	responsibility = zeros( (m, K) )
	r = responsibility
	beta = 4

	for i in range(0, m):
		lowest 		 = 999
		lowest_index = 0
		sumofcost = 0

		for k in range( 0, K ):
			cost = X[i] - centroids[k] 
			cost = cost.T.dot( cost ) # d(m, x) in the Mackay's book
			cost = exp(-beta * cost)
			sumofcost = sumofcost + cost
		for k in range(0,K):
			cost = X[i] - centroids[k]
			cost = cost.T.dot( cost )
			cost = exp(-beta * cost) 
			responsibility[i][k] = cost / sumofcost
			
	
			if r[i][k] < lowest: 
				lowest_index = k
				lowest 		 = r[i][k]

		idx[i] = lowest_index

	return idx+1, r # add 1, since python's index starts at 0

		
def computeCentroids( X, idxr, K):
	m, n = shape( X )	
	centroids = zeros((K, n))
	idx = idxr[0]
	r = idxr[1]

	data = c_[X, idx] # append the cluster index to the X

	for k in range( 1, K+1 ):
		
		for j in range( 0, n ):
			centroids[k-1, j] = sum(r[:, k-1].T.dot(X[:,j]))/sum(r[:,k-1])

	return centroids

def runkMeans( X, initial_centroids, max_iters, plot=False ):
	K 			= shape( initial_centroids )[0]
	centroids 	= copy( initial_centroids )
	idx 		= None

	for iteration in range( 0, max_iters ):
		idxr 		= findClosestCentroids( X, centroids )
		centroids 	= computeCentroids( X, idxr, K )
	
		if plot is True:	
			data = c_[X, idxr[0]]
			fig, ax = pyplot.subplots()

			# Extract data that falls in to cluster 1, 2, and 3 respectively, and plot them out
			data_1 = data[data[:, 2] == 1]
			ax.plot( data_1[:, 0], data_1[:, 1], 'ro', markersize=5 )

			data_2 = data[data[:, 2] == 2]
			ax.plot( data_2[:, 0], data_2[:, 1], 'go', markersize=5 )

			data_3 = data[data[:, 2] == 3]
			ax.plot( data_3[:, 0], data_3[:, 1], 'bo', markersize=5 )
			
			data_4 = data[data[:, 2] == 4]
			ax.plot( data_4[:, 0], data_4[:, 1], 'yo', markersize=5 )
			
			ax.plot( centroids[:, 0], centroids[:, 1], 'k*', markersize=14 )
			
			pyplot.xlim([-0.3,1.3])
			pyplot.ylim([-0.3,1.3])
			
			beta = 4
			circle0= pyplot.Circle(centroids[0],1/sqrt(beta),color='r',fill=False)
			circle1= pyplot.Circle(centroids[1],1/sqrt(beta),color='g',fill=False)
			circle2= pyplot.Circle(centroids[2],1/sqrt(beta),color='b',fill=False)
			circle3= pyplot.Circle(centroids[3],1/sqrt(beta),color='y',fill=False)
			
			ax.add_artist(circle0)
			ax.add_artist(circle1)
			ax.add_artist(circle2)
			ax.add_artist(circle3)
			
			
			
			

			pyplot.show( block=True )

	return centroids, idxr[0]

def kMeansInitCentroids( X, K ):
	return np.random.permutation( X )[:K]

def part1_1(X, centroids):
	
	K 	=  4

	initial_centroids = centroids

	idxr = findClosestCentroids( X, initial_centroids )
	print idxr[1]
	
	
	centroids = computeCentroids( X, idxr, K )
	print centroids
	# should be 
	# [[ 2.428301  3.157924]
	#  [ 5.813503  2.633656]
	#  [ 7.119387  3.616684]]


def part1_2(X,centroids):
	K 	= 4

	max_iters = 20
	
	runkMeans( X, centroids, max_iters, plot=True )



def part1_3(X,centroids):
	K 	= 4

	max_iters = 4
	print kMeansInitCentroids( X, K ) # it's randomly one of the coordinates from X


def main():
	set_printoptions(precision=6, linewidth=200)
	displaydata()
	centroids = array([[random.random(), random.random()], [random.random(), random.random()], [random.random(), random.random()],[random.random(), random.random()]])
	part1_1(X,centroids)
	part1_2(X,centroids)
	part1_3(X,centroids)
	

if __name__ == '__main__':
	main()
	

