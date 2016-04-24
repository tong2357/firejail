#!/bin/bash
# This file is part of Firejail project
# Copyright (C) 2014-2016 Firejail Authors
# License GPL v2

export MALLOC_CHECK_=3
export MALLOC_PERTURB_=$(($RANDOM % 255 + 1))

echo "TESTING: environment variables (test/environment/env.exp)"
./env.exp

echo "TESTING: shell none(test/environment/shell-none.exp)"
./shell-none.exp

which dash
if [ "$?" -eq 0 ];
then
        echo "TESTING: dash (test/environment/dash.exp)"
        ./dash.exp
else
        echo "TESTING: dash not found"
fi

which csh
if [ "$?" -eq 0 ];
then
        echo "TESTING: csh (test/environment/csh.exp)"
        ./csh.exp
else
        echo "TESTING: csh not found"
fi

which zsh
if [ "$?" -eq 0 ];
then
        echo "TESTING: zsh (test/environment/zsh.exp)"
        ./csh.exp
else
        echo "TESTING: zsh not found"
fi

echo "TESTING: rlimit (test/environment/rlimit.exp)"
./rlimit.exp

echo "TESTING: rlimit profile (test/environment/rlimit-profile.exp)"
./rlimit-profile.exp

