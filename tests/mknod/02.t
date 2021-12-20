#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/mknod/02.t 211352 2010-08-15 21:24:17Z pjd $

desc="mknod returns ENAMETOOLONG if a component of a pathname exceeded {NAME_MAX} characters"

dir=`dirname $0`
. ${dir}/../misc.sh

require mknod

echo "1..4"

nx=`namegen_max`
nxx="${nx}x"

expect 0 mknod ${nx} f 0644 0 0
expect fifo,0644 stat ${nx} type,mode
expect 0 unlink ${nx}
expect ENAMETOOLONG mknod ${nxx} f 0644 0 0

