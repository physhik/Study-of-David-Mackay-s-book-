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

print len(data)
datax=[]
for i in range(len(data)):
	datax=datax+[data[i][0]]
	
datay=[]
for i in range(len(data)):
	datay=datay+[data[i][1]]

plt.scatter(datax,datay)
plt.show()
	
assign = []
l=2
ctensor=[]
ctensorx=[]
ctensory=[]
update_assign=[]

for j in range(l):
	assign=assign+[[random.random(),random.random()]]
	ctensor=ctensor+[[]]
	ctensorx=ctensorx+[[]]
	ctensory=ctensory+[[]]
	update_assign=update_assign+[[]]



turn=0

while turn<100:
	turn=turn+1
	for k in range(l):
		lowest = 2	
		for i in range(len(data)):
			while LA.norm(np.array(assign[k])-np.array(data[i]))<lowest:
				lowest = LA.norm(np.array(assign[k])-np.array(data[i]))
			ctensor[k]=ctensor[k]+[data[i]]
			
		for j in range(len(ctensor[k])):
			ctensorx[k]= ctensorx[k]+[ctensor[k][j][0]]
			ctensory[k]= ctensory[k]+[ctensor[k][j][1]]
		
		update_assign[k]=[np.mean(ctensorx[k]),np.mean(ctensory[k])]
	

	assign= update_assign	
print assign

colors=['r','g']

fig, ax=plt.subplots()
for m in range(l):
	ax.scatter(ctensorx[m],ctensory[m],color=colors[m])
plt.show()


	


	