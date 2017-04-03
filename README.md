## Spectral Clustering (Soft K-means)

I felt there's no good python tutorial for spectral clustering. I had made it up by myself.  

The theory for clustering and soft k-means can be found at the [book](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html "Information Theory, Inference, and Learning Algorithms") of David Mackay.

### Some review

####Why clustering?

First, a good clustering has predictive power. Second, clusters can be a useful aid to communication because they allow lossy compression. A third reason for making a cluster model is that failures of the cluster model may highlight interesting objects that deserve special attention. A fourth reason for liking clustering algorithms is that they may serve as models of learning processes in neural systems.

#### K-means

The K-means algorithm is an algorithm for putting N data points in an M-dimensional space into K clusters. Each cluster is parameterized by a vector${\textbf m}^{(k)}$ called its mean. 

First of all, set K means {${\textbf m}^{(k)}$} to random values. In the assignment step, each data point n isassigned to the nearest mean. 
$$
\hat k^{(n)} = argmin_k d({\textbf m}^{(k)}, {\textbf x}^{(n)})
$$
An alternative, equivalent representation of this assignment ofpoints to clusters is given by `responsibilities', which are indicatorvariables $r^{(n)}_k$. In the assignment step, we set $r^{(n)}_k$ to one if mean k is the closest mean to datapoint $ {\textbf x}^{(n)}$; otherwise, $r^{(n)}_k$ is zero.
$$
r^{(n)}_k = \{
\begin{array}{cc}
1 ~~~~~~if ~\hat k^{(n)}=k\\
0 ~~~~~~if ~\hat k^{(n)}\ne k\\
\end{array}
$$
In the update step, the means are adjusted tomatch the sample means of the data points that they are responsible for. The update step is very similar to how to find the center of the mass in physics. 
$$
{\textbf m}^{(k)}= {\Sigma_n ~ r^{(n)}_k {\textbf x}^{(n)} \over R^{(k)}}
$$
where $R^{(k)}$ is the total responsibility of mean $k$
$$
R^{(k)}=\Sigma_n~r^{(n)}_k
$$


