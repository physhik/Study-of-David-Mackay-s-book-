import random
import numpy as np
from numpy import linalg as LA
import matplotlib.pyplot as plt


N=100
K=4

data1=[[0.5+0.5*random.random(),0.5+0.5*random.random()] for i in range(N)]
data2=[[0.5*random.random(),0.5*random.random()] for i in range(N)]
	
data1=np.array(data1)
data2=np.array(data2)	

data = np.concatenate((data1,data2))

datax=data[:,0]
datay=data[:,1]

def displaydata():
	plt.scatter(datax,datay)
	plt.show()
	

assign = [[random.random(),random.random()] for k in range(K)]
assign=np.array(assign)

c0=[]
c1=[]
c2=[]
c3=[]	

a=0
while a<100:
	a=a+1
	for i in range(len(data)):
		if LA.norm(np.array(assign[0])-np.array(data[i]))<LA.norm(np.array(assign[1])-np.array(data[i])) and LA.norm(np.array(assign[0])-np.array(data[i]))<LA.norm(np.array(assign[2])-np.array(data[i])) and LA.norm(np.array(assign[0])-np.array(data[i]))<LA.norm(np.array(assign[3])-np.array(data[i])):
			c0=c0+[data[i]]
		elif LA.norm(np.array(assign[1])-np.array(data[i]))<LA.norm(np.array(assign[2])-np.array(data[i])) and LA.norm(np.array(assign[1])-np.array(data[i]))<LA.norm(np.array(assign[0])-np.array(data[i])) and LA.norm(np.array(assign[1])-np.array(data[i]))<LA.norm(np.array(assign[3])-np.array(data[i])):
			c1=c1+[data[i]]
		elif LA.norm(np.array(assign[2])-np.array(data[i]))<LA.norm(np.array(assign[0])-np.array(data[i])) and LA.norm(np.array(assign[2])-np.array(data[i]))<LA.norm(np.array(assign[1])-np.array(data[i])) and LA.norm(np.array(assign[2])-np.array(data[i]))<LA.norm(np.array(assign[3])-np.array(data[i])):
			c2=c2+[data[i]]
		else:
			c3=c3+[data[i]]
	
	update_assign=[[float(sum(l))/len(l) for l in zip(*c0)],[float(sum(l))/len(l) for l in zip(*c1)],[float(sum(l))/len(l) for l in zip(*c2)], [float(sum(l))/len(l) for l in zip(*c3)]]

	assign= update_assign
	
	
	
	
print assign
	
c0x=[]
for i in range(len(c0)):
	c0x=c0x+[c0[i][0]]
	
c0y=[]
for i in range(len(c0)):
	c0y=c0y+[c0[i][1]]
	
c1x=[]
for i in range(len(c1)):
	c1x=c1x+[c1[i][0]]
	
c1y=[]
for i in range(len(c1)):
	c1y=c1y+[c1[i][1]]
	
c2x=[]
for i in range(len(c2)):
	c2x=c2x+[c2[i][0]]
	
c2y=[]
for i in range(len(c2)):
	c2y=c2y+[c2[i][1]]
	
c3x=[]
for i in range(len(c3)):
	c3x=c3x+[c3[i][0]]
	
c3y=[]
for i in range(len(c3)):
	c3y=c3y+[c3[i][1]]
	
	

fig, ax=plt.subplots()
ax.scatter(c0x,c0y,color='r')
ax.scatter(c1x,c1y,color='g')
ax.scatter(c2x,c2y,color='b')
ax.scatter(c3x,c3y,color='y')
plt.show()


	


	