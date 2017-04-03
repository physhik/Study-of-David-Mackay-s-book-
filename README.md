
## Spectral Clustering (Soft K-means)

I felt there's no good python tutorial for spectral clustering. I had made it up by myself.  

The theory for clustering and soft k-means can be found at the [book](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html "Information Theory, Inference, and Learning Algorithms") of David Mackay.


![data points plot](https://github.com/physhik/spectral-clustering/blob/master/datapoints.png)

Here are the data points. I chose random 50 data from the two boxes with 0.5 lengthy edges. We know the proper K-number for K-means clustering is 2. However, when we set K>2, the K-means clustering gives a ugly result. Besides, the clustering strongly depends on the initial choice of the 4 assignment points.  

![Hard K-means clustering](https://github.com/physhik/spectral-clustering/blob/master/hardkmeans.png)

If we set the stiffness of the soft clustering well, we can obtain the following graph.  
 
 
![2 clusters](https://github.com/physhik/spectral-clustering/blob/master/2clusters.png)
 
It still looks like 4 colored clusters, but the circles show the 4 clusters reduced to 2 clusters. the size of the circle is decided by the stiffness. 

![better 2 clusters ](https://github.com/physhik/spectral-clustering/blob/master/2clusters.png)

 
### Some review

