import random
import numpy as np
from numpy import linalg as LA
import matplotlib.pyplot as plt
from matplotlib.patches import Ellipse
import math

#data1=[]
#for i in range(100):
#	data1=data1+[[0.5+0.5*random.random(),0.5+0.5*random.random()]]
	
data2=[]
for i in range(100):
	data2=data2+[[0.5*random.random(),0.5*random.random()]]

data3 =[]
for i in range(30):
	data3=data3+[[random.random(),0.8+0.1*random.random()]]

data=data2+data3#+data1



datax=[]
for i in range(len(data)):
	datax=datax+[data[i][0]]
	
datay=[]
for i in range(len(data)):
	datay=datay+[data[i][1]]

plt.scatter(datax,datay)
plt.show()


	
assignx = []
assigny = []

for k in range(4):
	assignx=assignx+[random.random()]

for k in range(4):
	assigny=assigny+[random.random()]



sum=[]
for i in range(len(data)):
	sum=sum+[[]]
r=[]	
for i in range(4):
	r=r+[[]]
	for j in range(len(data)):
		r[i]=r[i]+[[]]
update_assignx=[[],[],[],[]]
update_assigny=[[],[],[],[]]




vx=[random.random(),random.random(),random.random(),random.random()]
vy=[random.random(),random.random(),random.random(),random.random()]

p=[random.random(),random.random(),random.random(),random.random()]
rsum=[[],[],[],[]]
turn = 0
while turn<8:
	turn = turn+1
	sum=[]
	for n in range(len(data)):
		sum=sum+[[]]
	for n in range(len(data)):
		s=0
		for k in range(4):
			s=s+p[k]/(2*np.pi*np.sqrt(vx[k]*vy[k]))*np.exp(-(assignx[k]-datax[n])**2/(2*vx[k])-(assigny[k]-datay[n])**2/(2*vy[k]))
			sum[n]=s
		for k in range(4):
			r[k][n]=p[k]/(2*np.pi*np.sqrt(vx[k]*vy[k]))*np.exp(-(assignx[k]-datax[n])**2/(2*vx[k])-(assigny[k]-datay[n])**2/(2*vy[k]))/s
			#print a,j,n,r[j][n]

	for k in range(4):
		rs=0
		for n in range(len(data)):
			rs=rs+r[k][n]
			rsum[k]=rs
			

		ua=[0,0]
		for n in range(len(data)):
			ua[0]=ua[0]+r[k][n]*datax[n]/float(rsum[k])
			ua[1]=ua[1]+r[k][n]*datay[n]/float(rsum[k])
			update_assignx[k]=ua[0]
			update_assigny[k]=ua[1]
			
			
	assignx= update_assignx
	assigny= update_assigny

	for k in range(4):
		for n in range(len(data)):
			vx[k]=vx[k]+r[k][n]*(datax[n]-assignx[k])**2/float(rsum[k])
			vy[k]=vy[k]+r[k][n]*(datay[n]-assigny[k])**2/float(rsum[k])
		
	print rsum
	rsumsum=0
	for k in range(4):
		rsumsum=rsumsum+rsum[k]
	
	p[k]=rsum[k]/float(rsumsum)	

print assignx, assigny

c=[[],[],[],[]]

for n in range(len(data)):
	a=[]
	for k in range(4):
		a=a+[r[k][n]]
	i=a.index(max(a))
	c[i]=c[i]+[data[n]]

ell0= Ellipse(xy=[assignx[0],assigny[0]],width=np.sqrt(vx[0]),height=np.sqrt(vy[0]),color='r',fill=False)
ell1= Ellipse(xy=[assignx[1],assigny[1]],width=np.sqrt(vx[1]),height=np.sqrt(vy[1]),color='g',fill=False)
ell2= Ellipse(xy=[assignx[2],assigny[2]],width=np.sqrt(vx[2]),height=np.sqrt(vy[2]),color='y',fill=False)
ell3= Ellipse(xy=[assignx[3],assigny[3]],width=np.sqrt(vx[3]),height=np.sqrt(vy[3]),color='b',fill=False)

fig=plt.figure(0) 
ax=fig.add_subplot(111, aspect='equal')
plt.xlim([-0.3,1.3])
plt.ylim([-0.3,1.3])
ax.add_artist(ell0)
ax.add_artist(ell1)
ax.add_artist(ell2)
ax.add_artist(ell3)

ax.scatter([x for x,y in c[0]],[y for x,y in c[0]],color='r')
ax.scatter([x for x,y in c[1]],[y for x,y in c[1]],color='g')
ax.scatter([x for x,y in c[2]],[y for x,y in c[2]],color='y')
ax.scatter([x for x,y in c[3]],[y for x,y in c[3]],color='b')


plt.show()

print np.sqrt(vx[0]),np.sqrt(vx[1]),np.sqrt(vx[2]),np.sqrt(vx[3])
print np.sqrt(vy[0]),np.sqrt(vy[1]),np.sqrt(vy[2]),np.sqrt(vy[3])

print np.var(c[0]),np.var(c[1]),np.var(c[2]),np.var(c[3])

	


	