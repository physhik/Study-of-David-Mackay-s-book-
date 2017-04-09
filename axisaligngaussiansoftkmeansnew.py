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

N=10

data1=[[0.3+0.6*random.random(),0.3+0.6*random.random()] for i in range(N)]
data2=[[0.2*random.random(),0.3*random.random()] for i in range(N)]
	
data1=array(data1)
data2=array(data2)	

data = concatenate((data1,data2))

X=c_[data[:,0],data[:,1]]




def displaydata():
	pyplot.scatter(X[:,0],X[:,1])
	pyplot.show()
	



def Responsibility( X, centroids , sigma, p ):
	K 	= shape( centroids )[0]
	m   = shape( X )[0]
	idx = zeros( (m, 1) )
	responsibility = zeros( (m, K) )
	r = responsibility
	D = 2
	

	for i in range( m ):
		lowest 		 = 999
		lowest_index = 0
		sumofcost = 0
		
		for k in range( K ):
			s = 0
			
			cost = X[i] - centroids[k]
			for j in range( D ):
				s = s + cost[j]**2/(2*sigma[k, j]**2)
			sumofcost = sumofcost + p[k]/(2*pi*sigma[k, 0]*sigma[k, 1])*exp(- s)
			
			
		for k in range( K ):
			s = 0
			cost = X[i] - centroids[k]
			for j in range( D ):
				s = s + cost[j]**2 / (2*sigma[k, j]**2)
			r[i, k] = p[k]/(2*pi*sigma[k, 0]*sigma[k, 1])*exp(- s) / sumofcost
			
			if r[i, k] < lowest: 
				lowest_index = k
				lowest 		 = r[i, k]

		idx[i] = lowest_index

	return idx, r 

		
def computeCentroids( X, idxr, K):
	m, n = shape( X )	
	centroids = zeros((K, n))
	idx = idxr[0]
	r = idxr[1]

	data = c_[X, idx] # append the cluster index to the X

	for k in range( K ):
		
		for j in range( 0, n ):
			centroids[k, j] = sum(r[:, k].T.dot(X[:,j]))/sum(r[:,k])

	return centroids
	
def SigmaAndPi(X, centroids, idxr , K):
	D = 2
	m, n = shape( X )
	idx, r = idxr
	sigma = zeros( ( K , D ) )
	R = 0.5 * ones( K )
	p = 0.5 * ones( K )
	
	for k in range( K ):
		R[k] = sum(r[:, k])
		p[k] = R[k] / sum(R)
		for j in range( D ):
			for i in range ( m ):
				dist = ( X[i] - centroids[k] )
				sigma[k, j] = sigma[k , j] + r[i, k]*dist[j]**2
			sigma[k, j]	= sigma[k, j] / R[k]
			sigma[k, j] = sqrt( sigma[k, j] )		
			
	return sigma, p 
	

def runkMeans( X, initial_centroids, max_iters, plot=False ):
	K 			= shape( initial_centroids )[0]
	D = 2
	centroids 	= copy( initial_centroids )
	#idx 		= None
	initial_sigma = 0.5 * ones( (K, D) )
	sigma = initial_sigma
	
	initial_p = 0.5 * ones( K )
	p = initial_p

	for iteration in range(  max_iters ):
		idxr 		= Responsibility( X, centroids , sigma, p)
		centroids 	= computeCentroids( X, idxr, K )
		sigma, p = SigmaAndPi(X, centroids, idxr , K)
	
		if plot is True:	
			data = c_[X, idxr[0]]
			fig, ax = pyplot.subplots()

			# Extract data that falls in to cluster 1, 2, and 3 respectively, and plot them out
			data_1 = data[data[:, 2] == 0]
			ax.plot( data_1[:, 0], data_1[:, 1], 'ro', markersize=5 )

			data_2 = data[data[:, 2] == 1]
			ax.plot( data_2[:, 0], data_2[:, 1], 'go', markersize=5 )

			#data_3 = data[data[:, 2] == 2]
			#ax.plot( data_3[:, 0], data_3[:, 1], 'bo', markersize=5 )
			
			#data_4 = data[data[:, 2] == 3]
			#ax.plot( data_4[:, 0], data_4[:, 1], 'yo', markersize=5 )
			
			ax.plot( centroids[:, 0], centroids[:, 1], 'k*', markersize=14 )
			
			pyplot.xlim([-0.3,1.3])
			pyplot.ylim([-0.3,1.3])
			
			circle0= pyplot.Circle(centroids[0],sigma[0],color='r',fill=False)
			circle1= pyplot.Circle(centroids[1],sigma[1],color='g',fill=False)
			#circle2= pyplot.Circle(centroids[2],sigma[2],color='b',fill=False)
			#circle3= pyplot.Circle(centroids[3],sigma[3],color='y',fill=False)
			
			ax.add_artist(circle0)
			ax.add_artist(circle1)
			#ax.add_artist(circle2)
			#ax.add_artist(circle3)
			
			
			
			

			pyplot.show( block=True )

	return centroids, idxr[0]

def kMeansInitCentroids( X, K ):
	return np.random.permutation( X )[:K]

def part1_1(X, centroids):
	
	K 	=  2

	initial_centroids = centroids
	initial_sigma = 0.5*ones( (K , 2))
	initial_p = 0.5*ones( K )

	idxr = Responsibility( X, initial_centroids , initial_sigma, initial_p)
	
	sigma, p = SigmaAndPi(X, initial_centroids, idxr , K)
	
	print idxr[0]
	print sigma
	print p
	
	centroids = computeCentroids( X, idxr, K )
	print centroids


def part1_2(X, centroids):
	K 	= 2

	max_iters = 1
	initial_centroids = centroids
	print centroids
	
	runkMeans( X, centroids, max_iters, plot=True )


def part1_3(X, centroids):
	K 	= 2

	max_iters = 1
	print kMeansInitCentroids( X, K ) # it's randomly one of the coordinates from X


def main():
	set_printoptions(precision=6, linewidth=200)
	displaydata()
	K = 2
	centroids = [[random.random(),random.random()] for k in range(K)]
	part1_1(X,centroids)
	part1_2(X,centroids)
	part1_3(X,centroids)
	

if __name__ == '__main__':
	main()
	
