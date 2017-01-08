#!/bin/sh
ssh -D 1337 -f -C -q -N ${1:-angel} -p ${2:-2222}
