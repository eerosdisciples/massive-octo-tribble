import matplotlib.pyplot as plt
import numpy as np
import csv
import matplotlib.cbook as cbook
import sys

#plt.rc('font', **{'family': 'serif', 'serif': ['Computer Modern'], 'size':20})
#plt.rcParams['text.latex.preamble']=[r"\usepackage{amsmath}"]
#plt.rc('text', usetex=True)

contour = np.genfromtxt('iter.wall_2d', delimiter='', skip_header=5)

r_contour = contour[:,0]
z_contour = contour[:,1]

fig = plt.figure()

#ax1 = plt.axes(frameon=True)
#ax1.get_xaxis().tick_bottom()
#ax1.axes.get_yaxis().set_visible(False)
#ax1.axes.get_xaxis().set_visible(False)

#results = np.genfromtxt('../ode-solver/particle.csv', delimiter=',', skip_header=8)
results = np.genfromtxt('particle'+sys.argv[1]+'.csv', delimiter=',', skip_header=8)

x = results[:,2]
y = results[:,3]
z = results[:,4]

r = np.sqrt(x**2 + y**2)


plt.plot(r_contour,z_contour, color='r')
plt.plot(r,z)
plt.axis('equal')

plt.xlabel(r'$r$ (m)')
plt.ylabel(r'$z$ (m)')


plt.grid()
plt.show()
