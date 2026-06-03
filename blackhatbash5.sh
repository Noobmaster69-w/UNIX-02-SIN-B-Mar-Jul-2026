#!/bin/bash/env bash
set -xr

touch test && touch test123
(ls; ps)
ls; ps; whoami
lzl || echo "El comando lzl fallo"
set +x