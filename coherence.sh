#!/bin/bash

output=$1
lang=$2

python compute_npmi.py output/$output/topics.txt ~/rcv2_data/$lang/train.npz ~/rcv2_data/$lang/train.vocab.json