# Python Bayesian inference and machine learning (David Mackay's machine learning textbook) 

During I study machine learning and python coding for it, the biggest trouble for me is that it's hard to find the python code for the core of the algorithm. It is easy to look for completed package, but it's never been so helpful for understanding how the real algorithm works. 

This repository contains the materials made by myself in order to help myself. Most essential theories and algorithms are given by a graduate level-[book](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html) Thus. the contents here will be much more helpful for you with David Mackay's [book](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html "Information Theory, Inference, and Learning Algorithms").

Especially, I followed Mackay's roadmap he introduced at the first of the book.  Inference, Bayesian theory, maximum likelihood and clustering, various Monter carlo method, neural network will be topics.


<p align="center">
<img src="https://github.com/physhik/spectral-clustering/blob/master/Roadmap.png" width="500">
</p>

## List of ipython notebooks and python codes. 

### 1. Clustering 

- [K-means clustering ipython notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Clustering.ipynb) 

- [K-means clustering python code](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/clusternew.py) 

- [Soft K-means clustering python code](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/softcluster.py)

- [Enhanced Soft K-means clustering python code](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeans.py)  

- [Axis-aligned Gaussian soft K-means python code](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/axisaligngaussiansoftkmeans.py)

### 2. Monte Carlo method

- [Rejection Sampling Monte Carlo method ipython notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMC.ipynb)

- [Importance Sampling Monte Carlo method ipython notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/ImportanceSampling.ipynb)

- [Metropolis-Hastings sampling Monte Carlo method ipython notebook and figure 29.12](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.12.ipynb)

- [Slice sampling Monte Carlo method ipython notebook and exercise 29.10](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise29.10.ipynb)

- [Hamiltonian Monte Carlo method ipython notebook and figure 30.2](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/HMC.ipynb)

- [Gibbs sampling Monte Carlo method and over-relaxation and figure 30.3](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Gibbs%20sampling%20and%20overrelaxation.ipynb)

### 3. neural network

Will be updated soon. 

## Displays 

Here I display the figures I gained from the above python codes and mathematica notebooks. I also solved some of challenging exercises in the book, which can be found in the [LateX file](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/David%20Mackay's%20book%20review%20and%20some%20solutions%20of%20exercises.pdf). 



### 1. Clustering

[ipython notebook for clustering](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Clustering.ipynb) 

I felt there's no good python tutorial for spectral clustering. The theory for clustering and soft k-means can be found at the [book](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html "Information Theory, Inference, and Learning Algorithms") of David Mackay. Especially I have read chapter 20 ~ 22 and used the algorithm in the book to obtain the following figures.

<p align="center">
<img src="https://github.com/physhik/spectral-clustering/blob/master/datapoints.png" width="400">
</p>

Here are the data points. I chose random 50 data from the two boxes with 0.5 lengthy edges. We know the proper K-number for K-means clustering is 2. However, when we set K>2, the K-means clustering gives a ugly result. Besides, the clustering strongly depends on the initial choice of the 4 assignment points.  


<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/hardkmeans.png" width="400">
</p>

If we set the stiffness of the soft clustering well, we can obtain the following figure.The python code for above 2 plots is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/clusternew.py) 
 
 
<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/2clusters.png" width="400">
</p>
 
 
It still looks like 4 colored clusters, but the circles show the 4 clusters reduced to 2 clusters. the size of the circle is decided by the stiffness. The python code is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/softclusternew.py) and [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/softcluster.py)


<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeans2.png" width="400">
</p>


The enhanced soft K-means allow each cluster to have independent size of the circle. In the figure, two circles vanish and 2 clear clusters remain.  
 
The radii of the two main circles are about 0.142(red) and 0.149(yellow). The standard deviations of the two clusters are about 0.02 and 0.02. My soft K-means clustering alogrithm gaussian distribution assume Gaussian distribution. And I chose uniformly random data points. The python code is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeansnew.py) and  [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeans.py)
 
<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeans3.png" width="400">
</p>


If the data are aligned, the circular deviation is not so good. We can split the deviations about each axis. Should be careful of overfitting. It is a weak point of this clustering. The code for above two results is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeans.py)  



<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/alignsoftkmeans.png" width="400">
</p>

The python code is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/axisaligngaussiansoftkmeans.py)

### 2. The chosen exercises for Bayesian inference and maximum likelihood. 

#### Maximum likelihood and posterior probability, exercise 24.3 of the book. 

This exercise is an extension of exercise 22.15. I think exercises 22.15 and 24.3 are very good examples to better understanding Bayesian theory. The disscusion for both exercises are completed in the [LateX file](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/David%20Mackay's%20book%20review%20and%20some%20solutions%20of%20exercises.pdf).

Posterior probability distribution function from given data. The distribution functions are not normalized yet. However, this plot already shows the maximum likelihood should be around mu=10. The small bumps around Xn=(-27, 3.6, 8) are also seen in the graph.

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/7scientistplot.png" width="400">
</p>



<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/7scientistplot2.png" width="400">
</p>


The mathematica analysis is found [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/Exercise24.3mathematica.pdf)


####  Laplace approximation of Poisson distribution, exercise 27.1 of the book. 

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/laplaceofpoisson.png" width="400">
</p>


The mathematica analyis is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise27.1mathematica.nb)

#### Bayesian regression, exercise 27.3 of the book


<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/LikelihoodAndBayesianRegression.png" width="400">
</p>


The mathematica analysis is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise27.3mathematica.pdf)

### 3. Monte Carlo method

#### Rejection sampling Monte Carlo method 

[ipython notebook for reject sampling Monte Carlo method](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMC.ipynb) 


<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMC.png" width="400">
</p>


The mathematica analysis is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMCmathematica.pdf)

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMC2.png" width="400">
</p>


The python code is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMC.py)



#### Importance sampling

What I understand about importance sampling is, when we numerically integrate some function, importance sampling can reduce the cost. The detail can be found in the next link. 

A practical difficulty with importance sampling is that it is hard to estimate
how reliable the estimator is. 

[ipython notebook for important sampling](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/ImportanceSampling.ipynb)



#### Metropolis-Hastings method 

[Metropolis method for a toy problem, reproduced figure 29.12, ipython notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.12.ipynb)

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/statesequence.png" width="400">
</p>

Histogram of occupancy of the states after 100, 400, and 1200 iterations from Metropolis-Hastings sampling

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/metropolissampling.png" width="400">
</p>

Histogram of occupancy of the states after 100, 400, and 1200 iterations from independent sampling

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/independentsampling.png" width="400">
</p>

#### Markov chain Monte Carlo sampling

[Markov chain Monte Carlo sampling, reproduced the figure 29.14, Mathematica notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14.pdf)

Transition matrix

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/transition_probability.png" width="400">
</p>

The probability densities

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-1.png" width="400">
</p>

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-2.png" width="400">
</p>

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-3.png" width="400">
</p>


<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-4.png" width="400">
</p>


<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-5.png" width="400">
</p>


<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-6.png" width="400">
</p>



#### Slice sampling Monte Carlo method 


[Slice sampling, exercise 29.10, ipython notebook notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise29.10.ipynb)

The exercise 29.10 is to find the turns from the peak to tail and from tail to peak. 

The probability density is given as the follwoing.  

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise29.10prob.png" width="400">
</p>



Using slice sampling (the code is found in the [ipython notebook link](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise29.10.ipynb)), the number of turns it takes from the peak to tail is as follows.  

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise29.10turns.png" width="400">
</p>

The average of the number of turns is about 5.2362. 

On the other hand, the average of the number of the turns from tail to peak is about 5.2967 from similar analysis. 

They are quite close, and it makes sense because the area of the peak and the tail in the density function are matched. 


#### Hamiltonian Monte Carlo method

[Hamiltonian Monte Carlo method, figure 30.2, ipython notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/HMC.ipynb)


One of the weak points of Monte Carlo sampling comes up with random walks. Hamiltonial Monte Carlo method (HMC) is an approach to reduce the randomzing in algorithm of the sampling. 

When we regard the energy of the system in probability distribution as potential energy term, the dynamical energy, the sum of the kinetic energy and the potential energy restrains the system. In other words, the dynamical energy conservation reduce the degree of the freedom of the system. And the phase space (x(t), p(t)) followed by Hamiltonian mechanism. As a result, the samples are to be chosen less randomly than Metropolis-Hastings sampling. 

The algorithm of Hamiltonian Monte Carlo sampling is as follows. 
<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/algorithmhmc.png" width="400">
</p>

Octave source code for the Hamiltonian Monte Carlo method. Note that it is made of two main algorithms, leapfrog algorithm and Metropoils-Hastings Monte Carlo sampling. Leapfrog algorithm is nothing but finitesimal movement of the position and the momentum by Hamiltonian equation. 



One of the main result is as a following picture. 

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/HMC.png" width="400">
</p>

I would not display all the figures I obtained. You can find more pictures and python code in the [ipython notebook link](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/HMC.ipynb). They dramatically strengthen the efficiency of the sampling. The long narrow ellipse is a contour plot of the 2 dimensional probability density function. Look how fast the points at (-1,1) converges inside the ellipse. Much less random than random walk.    


#### Gibbs sampling and over-relaxation

[Gibbs sampling and over-relaxation, figure 30.3, ipython notebook ](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Gibbs%20sampling%20and%20overrelaxation.ipynb)

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/gibbsandoverrelaxation.png" width="400">
</p>

Think about narrow probability density like the above figures. All the 4 samples start at (-1.3, -1.3). Left two figures are sampled by Gibbs sampling, and the right two subplots are by over-relaxation. Thus, it reduces random walk behaviour in Gibbs sampling. 

#### Ising model and Monte Carlo method

[Ising model and Monte Carlo method, figure 31.2, ipython notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Isingmodel.ipynb)

<p align="center">
<img src="https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Isingmodel.png" width="400">
</p>

We consider spin 1/2 systems. There are spin-ups(blue) and downs(red).  
The first subplot is by random spins. The 2nd one is by Ising model at low temperature. The spins are aligned and the symmetry(randomness) is broken(lost). 