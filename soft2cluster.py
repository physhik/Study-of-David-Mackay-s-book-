import random
import numpy as np
from numpy import linalg as LA
import matplotlib.pyplot as plt
import math

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
print len(data)




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
b=100.0
while a<10:
	a=a+1 
	sum=[]
	for i in range(len(data)):
		sum=sum+[[]]
	for n in range(len(data)):
		s=0
		for k in range(4):
			s=s+np.exp(-b*(LA.norm(np.array(assign[k])-np.array(data[n]))))
			sum[n]=s
		for j in range(4):
			r[j][n]=np.exp(-b*(LA.norm(np.array(assign[j])-np.array(data[n]))))/s
			print a,j,n,r[j][n]
	rsum=[]
	for i in range(4):
		rsum=rsum+[[]]
	for k in range(4):
		rs=0
		for n in range(len(data)):
			rs=rs+r[k][n]
			rsum[k]=rs
		ua=[0,0]
		for n in range(len(data)):
			ua[0]=ua[0]+r[k][n]*data[n][0]/float(rs)
			ua[1]=ua[0]+r[k][n]*data[n][1]/float(rs)
			update_assign[k]=ua
			
	assign= update_assign	
	
print assign
c=[[],[],[],[]]
for n in range(len(data)):
	for k in range(4):
		if r[k][n]>0.8:
			c[k]=c[k]+[data[n]]	

print c[0]

circle0= plt.Circle(assign[0],1/math.sqrt(b),color='r',fill=False)
circle1= plt.Circle(assign[1],1/math.sqrt(b),color='g',fill=False)
circle2= plt.Circle(assign[2],1/math.sqrt(b),color='y',fill=False)
circle3= plt.Circle(assign[3],1/math.sqrt(b),color='b',fill=False)

fig, ax=plt.subplots()
ax.add_artist(circle0)
ax.add_artist(circle1)
ax.add_artist(circle2)
ax.add_artist(circle3)

ax.scatter([x for x,y in c[0]],[y for x,y in c[0]],color='r')
ax.scatter([x for x,y in c[1]],[y for x,y in c[1]],color='g')
ax.scatter([x for x,y in c[2]],[y for x,y in c[2]],color='y')
ax.scatter([x for x,y in c[3]],[y for x,y in c[3]],color='b')


plt.show()


	


	