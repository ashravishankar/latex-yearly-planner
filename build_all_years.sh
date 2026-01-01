#!/bin/bash
export PATH=$PATH:/usr/local/go/bin

for YEAR in 2028 2029 2030 2031 2032 2033; do
    echo "=== Building $YEAR ==="
    rm -rf out
    mkdir -p out
    PLANNER_YEAR=$YEAR \
    PASSES=2 \
    CFG="cfg/base_lined.yaml,cfg/template_months_on_side.yaml,cfg/sn_a5x.mos.default.yaml" \
    NAME="planner.$YEAR.full.lined" \
    ./single.sh
    cp out/sn_a5x.mos.default.pdf planner.$YEAR.full.lined.pdf
    echo "=== $YEAR DONE ==="
done

echo "=== ALL YEARS COMPLETE ==="
ls -lh planner.*.full.lined.pdf

