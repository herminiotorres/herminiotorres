import numpy as np

def calculate(list):
    if len(list) != 9:
        raise ValueError("List must contain nine numbers.")

    c = np.array(list).reshape((3,3))

    calculations = {
        'mean': [np.mean(c, axis=0).tolist(), np.mean(c, axis=1).tolist(), np.mean(c)],
        'variance': [np.var(c, axis=0).tolist(), np.var(c, axis=1).tolist(), np.var(c)],
        'standard deviation': [np.std(c, axis=0).tolist(), np.std(c, axis=1).tolist(), np.std(c)],
        'max': [np.max(c, axis=0).tolist(), np.max(c, axis=1).tolist(), np.max(c)],
        'min': [np.min(c, axis=0).tolist(), np.min(c, axis=1).tolist(), np.min(c)],
        'sum': [np.sum(c, axis=0).tolist(), np.sum(c, axis=1).tolist(), np.sum(c)]
    }
    return calculations
