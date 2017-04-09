# David Mackay's machine learning book review

In this repository, I put the materials for studying David Mackay's [book](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html "Information Theory, Inference, and Learning Algorithms") of David Mackay, which I made to help myself and others want to study the book and machine learnings. 

In this md file, I will put some visual results I code during study. Bayesian theory, maximum likelihood and clustering, various Monter carlo method, neural network will be topics. Chapter 1-3, 20-24, 27-24,38-45 of the book. 

I also solved some of challenging exercises in the book, and included in the Latex file. There's some numerical or analytic calculations for the book in the Mathematica files. Most of algorithms in the above chapters are also represented in the python files. I will put some numerical tests from the algorithms on this md files. 

## Spectral Clustering (Soft K-means)

I felt there's no good python tutorial for spectral clustering.   

The theory for clustering and soft k-means can be found at the [book](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html "Information Theory, Inference, and Learning Algorithms") of David Mackay. Especially I have read chapter 20 ~ 22 and used the algorithm in the book to obtain the following figures.


![data points plot](https://github.com/physhik/spectral-clustering/blob/master/datapoints.png)

Here are the data points. I chose random 50 data from the two boxes with 0.5 lengthy edges. We know the proper K-number for K-means clustering is 2. However, when we set K>2, the K-means clustering gives a ugly result. Besides, the clustering strongly depends on the initial choice of the 4 assignment points.  

![Hard K-means clustering](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/hardkmeans.png)

If we set the stiffness of the soft clustering well, we can obtain the following figure.The python code for above 2 plots is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/cluster(new).py) 
 
 
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

Posterior probability distribution function from given data. The distribution functions are not normalized yet. However, this plot already shows the maximum likelihood should be around mu=10. The small bumps around $x_n=(-27,~3.6,~8)$ are also seen in the graph.

![Posterior probability distribution function from given data](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/7scientistplot.png)

![Posterior probability distribution function from given data around x=-27](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/7scientistplot2.png)

The mathematica file is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/Exercise24.3.nb)


## Exercise 27.1 of the book. 

Laplace approximation of Poisson distribution


![Posterior probability distribution function from given data](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/laplaceofpoisson.png)

The mathematica file is [here](https://github.com/physhik/Study-of-David-Mackay-s-book-/blob/master/Exercise27.1.nb)