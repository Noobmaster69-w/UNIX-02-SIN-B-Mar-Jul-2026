#!/bin/bash/env bash

set-x

let result="4 * 5"
echo ${result1}

let result=(("5 * 5"))
echo ${result2}

result=$(expr 5 + 505)
echo ${result3}

set+x
#man expr