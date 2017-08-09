# David Mackay's machine learning book 

During I study machine learning and python coding for it, the biggest trouble for me is that it's hard to find the python code for the core of the algorithm. It is easy to look for completed package, but it's never been so helpful for understanding how the real algorithm works. 

This repository contains the materials made by myself in order to help myself. Most essential theories and algorithms are given by a graduate level-[book](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html) Thus. the contents here will be much more helpful for you with David Mackay's [book](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html "Information Theory, Inference, and Learning Algorithms").

Especially, I followed Mackay's roadmap he introduced at the first of the book. 

![roadmap](https://github.com/physhik/spectral-clustering/blob/master/Roadmap.png = 100x)

In this md file, I will put some visual results I code during study. Bayesian theory, maximum likelihood and clustering, various Monter carlo method, neural network will be topics. Chapter 1-3, 20-24, 27-24,38-45 of the book. 

I also solved some of challenging exercises in the book, and included in the LateX file. If you find the following displays interesting and want to see some detail, see the [link](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/David%20Mackay's%20book%20review%20and%20some%20solutions%20of%20exercises.pdf). There's some numerical or analytic calculations for the book in the Mathematica files. Most of algorithms in the above chapters are also represented in the python files. I will put some numerical tests http://markdowntutorial.com/lesson/7from the algorithms on this md files. 

## Spectral Clustering (Soft K-means)

### [ipython notebook for clustering](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Clustering.ipynb) 

I felt there's no good python tutorial for spectral clustering.   

The theory for clustering and soft k-means can be found at the [book](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html "Information Theory, Inference, and Learning Algorithms") of David Mackay. Especially I have read chapter 20 ~ 22 and used the algorithm in the book to obtain the following figures.


![data points plot](https://github.com/physhik/spectral-clustering/blob/master/datapoints.png)

Here are the data points. I chose random 50 data from the two boxes with 0.5 lengthy edges. We know the proper K-number for K-means clustering is 2. However, when we set K>2, the K-means clustering gives a ugly result. Besides, the clustering strongly depends on the initial choice of the 4 assignment points.  

![Hard K-means clustering](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/hardkmeans.png)

If we set the stiffness of the soft clustering well, we can obtain the following figure.The python code for above 2 plots is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/clusternew.py) 
 
 
![2 clusters](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/2clusters.png)
 
It still looks like 4 colored clusters, but the circles show the 4 clusters reduced to 2 clusters. the size of the circle is decided by the stiffness. The python code is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/softclusternew.py) and [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/softcluster.py)

![better 2 clusters ](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeans2.png)

The enhanced soft K-means allow each cluster to have independent size of the circle. In the figure, two circles vanish and 2 clear clusters remain.  
 
The radii of the two main circles are about 0.142(red) and 0.149(yellow). The standard deviations of the two clusters are about 0.02 and 0.02. My soft K-means clustering alogrithm gaussian distribution assume Gaussian distribution. And I chose uniformly random data points. The python code is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeansnew.py) and  [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeans.py)
 

![better and different 2 clusters ](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeans3.png)


If the data are aligned, the circular deviation is not so good. We can split the deviations about each axis. Should be careful of overfitting. It is a weak point of this clustering. The code for above two results is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/enhancedsoftkmeans.py)  

![aligned 2 clusters ](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/alignsoftkmeans.png)

The python code is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/axisaligngaussiansoftkmeans.py)

## Exercise 24.3 of the book. 

In case that the exercise asks some plots or numerical tests, I display plots on this md file. 

Posterior probability distribution function from given data. The distribution functions are not normalized yet. However, this plot already shows the maximum likelihood should be around mu=10. The small bumps around Xn=(-27, 3.6, 8) are also seen in the graph.

![Posterior probability distribution function from given data](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/7scientistplot.png)

![Posterior probability distribution function from given data around x=-27](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/7scientistplot2.png)

The mathematica analysis is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/Exercise24.3mathematica.nb)


## Exercise 27.1 of the book. 

Laplace approximation of Poisson distribution


![Posterior probability distribution function from given data](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/laplaceofpoisson.png)

The mathematica analyis is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise27.1mathematica.nb)

## Exercise 27.3 of the book

![Likelihood and Bayesian Regression](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/LikelihoodAndBayesianRegression.png)

The mathematica analysis is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise27.3mathematica.pdf)


## Rejection sampling Monte Carlo method 

### [ipython notebook for reject sampling Monte Carlo method](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMC.ipynb) 

![RejectSamplingMC mathematica](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMC.png)

The mathematica analysis is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMCmathematica.pdf)

![RejectSamplingMC python](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMC2.png)

The python code is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/RejectSamplingMC.py)


## Importance sampling

What I understand about importance sampling is, when we numerically integrate some function, importance sampling can reduce the cost. The detail can be found in the next link. 

A practical difficulty with importance sampling is that it is hard to estimate
how reliable the estimator is. 

### [ipython notebook for important sampling](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/ImportanceSampling.ipynb)



## Metropolis-Hastings method 

### [Reproduce the figure 29.12, ipython notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.12.ipynb)



![state sequence](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/statesequence.png)

![Histogram of occupancy of the states after 100, 400, and 1200 iterations](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/metropolissampling.png)

![Histogram of occupancy of the states after 100, 400, and 1200 iterations](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/independentsampling.png)

### [Reproduce the figure 29.14, Mathematica notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14.pdf)

![transition probability](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/transition_probability.png)

![Reproduce the figure 29.14](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-1.png)

![Reproduce the figure 29.14](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-2.png)

![Reproduce the figure 29.14](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-3.png)

![Reproduce the figure 29.14](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-4.png)

![Reproduce the figure 29.14](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-5.png)

![Reproduce the figure 29.14](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/reproduceFigure29.14-6.png)


## Slice sampling Monte Carlo method 


### [Exercise 29.10, ipython notebook notebook](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise29.10.ipynb)

The exercise 29.10 is to find the turns from the peak to tail and from tail to peak. 

The probability density is given as the follwoing.  

![probability density](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise29.10prob.png)


Using slice sampling (the code is found in the [ipython notebook link](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise29.10.ipynb)), the number of turns it takes from the peak to tail is as follows.  

![number of turns](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise29.10turns.png)

The average of the number of turns is about 5.2362. 

On the other hand, the average of the number of the turns from tail to peak is about 5.2967. 

They are quite close, and it makes sense because the area of the peak and the tail in the density function are matched. 


## Hamiltonian Monte Carlo method

One of the weak points of Monte Carlo sampling comes up with random walks. Hamiltonial Monte Carlo method (HMC) is an approach to reduce the randomzing in algorithm of the sampling. 

When we regard the energy of the system in probability distribution as potential energy term, the dynamical energy, the sum of the kinetic energy and the potential energy restrains the system. In other words, the dynamical energy conservation reduce the degree of the freedom of the system. And the phase space (x(t), p(t)) followed by Hamiltonian mechanism. As a result, the samples are to be chosen less randomly than Metropolis-Hastings sampling. 

The algorithm is as follows. 

![algorithm of HMC](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/algorithmhmc.png)

Octave source
code for the Hamiltonian Monte
Carlo method. Note that it is made of two main algorithms, leapfrog algorithm and Metropoils-Hastings Monte Carlo sampling. Leapfrog algorithm is nothing but finitesimal movement of the position and the momentum by Hamiltonian equation. 

The python code for HMC is in the [ipython notebook link](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/HMC.ipynb)


One of the main result is as a following picture. 

![HMC](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/HMC.png)

You can find more pictures and python code in the [ipython notebook link](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/HMC.ipynb)


## Gibbs sampling and over-relaxation

The python code for HMC is in the [ipython notebook link](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Gibbs%20sampling%20and%20overrelaxation.ipynb)

One of the figure showing a big over-relaxation. 

![overrelaxation](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/overrelaxation.png)
