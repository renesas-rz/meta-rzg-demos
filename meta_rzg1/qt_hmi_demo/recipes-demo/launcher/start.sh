#!/bin/sh

cd $1

shift

LD_PRELOAD=/usr/lib/libEGL.so  $*