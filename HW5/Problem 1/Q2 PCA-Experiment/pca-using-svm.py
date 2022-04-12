import numpy as np
import matplotlib.pyplot as plt
from scipy.io import loadmat

#Ref: https://numpy.org/doc/stable/reference/generated/numpy.linalg.svd.html

def pca_using_svd(p, matrix):
    #we do not intend to have u and vh to have the shapes (..., M, M) and (..., N, N),
    u,s,vh = np.linalg.svd(matrix, full_matrices=False)
    v = np.concatenate((np.ones(p), np.zeros(s.shape[0]-p)))
    y = np.multiply(s,v)
    return u@np.diag(y)@vh

#load dataset
data = loadmat('/content/sample_data/USPS.mat')
input_matrix = data["A"]


fig, ax = plt.subplots(4,2, figsize=(15,15))
ax = ax.ravel()
#print(axs)
p_val=[10, 50, 100, 200]

for i in range(len(p_val)):
  print('p value', p_val[i])
  new = pca_using_svd(p_val[i], input_matrix)
  subset_1 = np.reshape(new[0, :], (16, 16))
  diff_1 = np.abs(new[0, :] - input_matrix[0, :])
  error_1 = np.sum(diff_1)
  print('Error',error_1)
  axs[i].imshow(subset_1,  cmap='gray')
  
  subset_2 = np.reshape(new[1, :], (16, 16))
  diff_2 = np.abs(new[1, :] - input_matrix[1, :])
  error_2 = np.sum(diff_2)
  print('Error',error_2)
  axs[i+4].imshow(subset_2,  cmap='gray')
