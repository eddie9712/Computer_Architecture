import sys
import matplotlib.pyplot as plt
f=open("result.txt","r")
lines=f.readlines()
arr1=[]
arr2=[]
for i in range(len(lines)):
    if i%2==0:
       arr1.append(float(lines[i]))
    else:
       arr2.append(float(lines[i]))
if sys.argv[1]=='1':
    plt.plot([100,1000,2000,5000,10000],[arr1[0],arr1[1],arr1[2],arr1[3],arr1[4]],'b-',label='naive')
    plt.plot([100,1000,2000,5000,10000],[arr2[0],arr2[1],arr2[2],arr2[3],arr2[4]],'r-',label='blocking')
    plt.xlabel('arraysize')
else:
    plt.plot([50,100,500,1000,5000],[arr1[0],arr1[1],arr1[2],arr1[3],arr1[4]],'b-',label='naive')
    plt.plot([50,100,500,1000,5000],[arr2[0],arr2[1],arr2[2],arr2[3],arr2[4]],'r-',label='blocking')
    plt.xlabel('blocksize')

plt.legend()
plt.ylabel('time(milliseconds)')
plt.show()
f.close()
