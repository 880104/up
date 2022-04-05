#!/bin/bash -x

SelfFile=$(realpath ${BASE_SOURCE[0]} || exit 1)
SelfDir=$(dirname $SelfFile || exit 1)

cd $SelfDir || exit 1

unxz ipfs.xz || exit 2

chmod +x ipfs || exit 3

./ipfs
