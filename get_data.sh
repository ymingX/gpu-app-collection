#!/bin/bash
export BASH_ROOT="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"
DATA_SUBDIR="/data_dirs/"
DATA_ROOT=$BASH_ROOT$DATA_SUBDIR
echo "BASH_ROOT=$BASH_ROOT"
echo "PWD=$PWD"
if [ ! -d $DATA_ROOT ]; then
	# 定义可能的文件路径
	if [ -f $BASH_ROOT/all.gpgpu-sim-app-data.tgz ]; then
	    TAR_FILE=$BASH_ROOT/all.gpgpu-sim-app-data.tgz
	elif [ -f $BASH_ROOT/../all.gpgpu-sim-app-data.tgz ]; then
	    TAR_FILE=$BASH_ROOT/../all.gpgpu-sim-app-data.tgz
	else
	    # 如果文件不存在，则下载文件到 $BASH_ROOT
	    wget https://engineering.purdue.edu/tgrogers/gpgpu-sim/benchmark_data/all.gpgpu-sim-app-data.tgz -O $BASH_ROOT/all.gpgpu-sim-app-data.tgz
	    TAR_FILE=$BASH_ROOT/all.gpgpu-sim-app-data.tgz
	fi
	tar xzvf $TAR_FILE -C $BASH_ROOT
fi
