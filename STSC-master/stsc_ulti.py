import numpy as np
from itertools import groupby
from scipy.linalg import eigh, inv, sqrtm


def reformat_result(cluster_labels, n):
    zipped_data = zip(cluster_labels, range(n))
    zipped_data = sorted(zipped_data, key=lambda x: x[0])
    grouped_feature_id = [[j[1] for j in i[1]] for i in groupby(zipped_data, lambda x: x[0])]
    return grouped_feature_id


def affinity_to_lap_to_eig(affinity):
    tril = np.tril(affinity, k=-1)
    a = tril + tril.T
    d = np.diag(a.sum(axis=0))
    dd = inv(sqrtm(d))
    l = dd.dot(a).dot(dd)
    w, v = eigh(l)
    return w, v


def get_min_max(w, min_n_cluster, max_n_cluster):
    if min_n_cluster is None:
        min_n_cluster = 2
    if max_n_cluster is None:
        max_n_cluster = np.sum(w > 0)
        if max_n_cluster < 2:
            max_n_cluster = 2
    if min_n_cluster > max_n_cluster:
        raise ValueError('min_n_cluster should be smaller than max_n_cluster')
    return min_n_cluster, max_n_cluster
