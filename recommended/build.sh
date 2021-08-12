#!/bin/bash

set -euo pipefail

BASE_DIR=$(pwd)
BUILD_DIR=${BASE_DIR}/build/

rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}/layer/R.orig/
cd ${BUILD_DIR}/layer/
cp -r ${BASE_DIR}/../r/build/bin/* R.orig/
mkdir -p R/library

recommended=(tidyverse ggplot2 reshape2 aws.s3 doParallel parallel memisc mice missForest Amelia Hmisc)
for package in "${recommended[@]}"
do
   mv R.orig/library/${package}/ R/library/${package}/
done
rm -rf R.orig/
chmod -R 755 .
