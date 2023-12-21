'''
Author: LKai-Xu
Date: 2023-12-19 09:20:47
LastEditors: LKai-Xu
LastEditTime: 2023-12-21 10:35:06
FilePath: \courses\proj\project_ref\py\sim.py
Description: 
'''
from weights import w1, w2
from images import im1, im4, im6, im7, im9

# you can change the image and predict the corresponding number
im = im6

# layer 1
x1 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
x2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
for i in range(10):
    for j in range(100):
        x1[i] += im[j] * w1[i][j]
    # truncate the accumulated result to an 8-bit number
    x2[i] = x1[i] >> 2
    # ReLU
    if x2[i] < 0:
        x2[i] = 0

print(x1)
print(x2)

# layer 2
x3 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
x4 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
for i in range(10):
    for j in range(10):
        x3[i] += x2[j] * w2[i][j]
    # truncate the accumulated result to an 8-bit number
    x4[i] = x3[i] >> 4

print(x3)
print(x4)

# find the max id
print('The number in the image is predicted to be', x4.index(max(x4)))

