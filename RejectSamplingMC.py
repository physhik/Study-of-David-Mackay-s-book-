
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import scipy.stats as stats

plt.style.use('ggplot')


x = np.linspace(-5, 5)

def f(x):
    return np.exp(0.4*(x-0.4)**2-0.08*x**4)

df = 10
upper = f(-1.75233) # maximum of f(x), found from differentiation. 

plt.figure(figsize=(12,4))
plt.subplot(121)
plt.plot(x, f(x))
plt.axhline(upper, color='grey')

px = -1.0

plt.arrow(px,0,0,f(px)-0.01, linewidth=1,
          head_width=0.2, head_length=0.01, fc='g', ec='g')

plt.arrow(px,upper,0,-(upper-f(px)-0.01), linewidth=1,
          head_width=0.3, head_length=0.01, fc='r', ec='r')
    
plt.text(px+.25, 2, 'Reject', fontsize=16)
plt.text(px+.25, 0.5, 'Accept', fontsize=16)

plt.axis([-5,5,0,4])

plt.title('Rejection sampling concepts', fontsize=20)


plt.subplot(122)

n = 100000

# generate from sampling distribution randomly and uniformly. 

u = np.random.uniform(-5, 5, n)

r = np.random.uniform(0, upper, n)


v = u[r < f(u)] # accepting procedure is in it. 


    
plt.plot(x, f(x), linewidth=2)

    

# Plot scaled histogram

factor = 7.85218 # Normalizing constant. Integrated value of f(x) from -5 to 5. 

hist, bin_edges = np.histogram(v, bins=100, normed=True)

bin_centers = (bin_edges[:-1] + bin_edges[1:]) / 2.

plt.step(bin_centers, factor*hist, linewidth=2)



plt.axis([-5,5,0,4])

plt.title('Histogram of accepted samples', fontsize=20);

plt.show()