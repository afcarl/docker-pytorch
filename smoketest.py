print "START"
import os
import torch
a = torch.rand(3)
b = a.cuda()
print b
from dask import distributed
client = distributed.Client()
print client
del client
os.system("rm -rf dask-worker-space")
print "END"
