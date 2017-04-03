import random
import numpy as np
from numpy import linalg as LA
import matplotlib.pyplot as plt

data1=[]
for i in range(100):
	data1=data1+[[0.5+0.5*random.random(),0.5+0.5*random.random()]]
	
data2=[]
for i in range(100):
	data2=data2+[[0.5*random.random(),0.5*random.random()]]


data=data1+data2

datax=[]
for i in range(len(data)):
	datax=datax+[data[i][0]]
	
datay=[]
for i in range(len(data)):
	datay=datay+[data[i][1]]

plt.scatter(datax,datay)
plt.show()
	
assign = []
for j in range(4):
	assign=assign+[[random.random(),random.random()]]
print assign

c0=[]
c1=[]
c2=[]
c3=[]	


sum=[]
for i in range(len(data)):
	sum=sum+[[]]
r=[]	
for i in range(4):
	r=r+[[]]
	for j in range(len(data)):
		r[i]=r[i]+[[]]
update_assign=[]
for k in range(4):
	update_assign=update_assign+[[]]	
a=0	
b=0.05
while a<1:
	a=a+1 
	sum=[]
	for i in range(len(data)):
		sum=sum+[[]]
	for n in range(len(data)):
		for k in range(4):
			s=0
			s=s+np.exp(-b*(LA.norm(np.array(assign[k])-np.array(data[n]))))
			sum[n]=s
		for j in range(4):		
			print np.exp(-b*(LA.norm(np.array(assign[3])-np.array(data[n]))))/s
			r[j][n]=np.exp(-b*(LA.norm(np.array(assign[j])-np.array(data[n]))))/s
	rsum=[]
	for i in range(4):
		rsum=rsum+[[]]
		
	for k in range(4):
		for n in range(len(data)):
			rs=0
			rs=rs+r[k][n]
			rsum[k]=rs
		for n in range(len(data)):
			ua=[0,0]
			ua[0]=ua[0]+r[k][n]*data[n][0]/float(rs)
			ua[1]=ua[0]+r[k][n]*data[n][1]/float(rs)
			update_assign[k]=ua
			
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


	


	