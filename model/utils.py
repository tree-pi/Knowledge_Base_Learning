

import numpy as np
import pandas as pd
def ind2onehot(inds,maxn):
    onehot = np.zeros((len(inds),maxn))
    for i in range(len(inds)):
        onehot[i][inds[i]]=1
    return onehot
def onehot2ind(onehots):
    inds = np.zeros(len(onehots),dtype=int)
    for k in range(len(onehots)):
        oh = onehots[k]
        inds[k] = np.argwhere(oh)
    return inds


def color_to_rgba(color, alpha): #if you wanna add alpha
    return  "rgba(%s,%s,%s,%s)" % (color+(alpha,))



    