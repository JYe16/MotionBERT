import argparse
import os.path

import numpy as np
import torch


def reverse_y_axis(sequence):
    if len(sequence) == 1:
        sequence[:, :, :, 1] = sequence[:, :, :, 1] * -1
    else:
        sequence[:, :, 1] = sequence[:, :, 1] * -1
    return sequence


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--file', type=str, default="")
    args = parser.parse_args()

    skl = torch.from_numpy(
        reverse_y_axis(np.load('/mnt/h/Datasets/Own/WiMesh-X/data/' + args.file + '/skl/' + args.file + '.npy')))
    torch.save(skl, os.path.join('/mnt/h/Datasets/Own/WiMesh-X/data/', args.file, 'skl', args.file + '.pt'))
