print "START"
import torch
a = torch.rand(3)
b = a.cuda()
print b
from dask import distributed
print distributed.Client()
print "END"
