#!/bin/bash

unxz ipfs.xz || exit 1

chmod +x ipfs || exit 2

./ipfs
