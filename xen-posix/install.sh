#!/bin/sh -ex

prefix=${1:-$PREFIX}
if [ "$prefix" = "" ]; then
  prefix=`opam config var prefix`
fi

odir=$prefix/lib
mkdir -p $odir/mirage-xen-posix
cp libxenposix.a $odir/mirage-xen-posix/libxenposix.a
cp flags/minios-cflags.sexp $odir/mirage-xen-posix/
cp flags/posix-cflags.sexp $odir/mirage-xen-posix/
cp flags/posix-libs.sexp $odir/mirage-xen-posix/
cp flags/minios-libs.sexp $odir/mirage-xen-posix/
touch $odir/mirage-xen-posix/META
mkdir -p $odir/pkgconfig
cp mirage-xen-minios.pc $odir/pkgconfig/mirage-xen-minios.pc
cp mirage-xen-posix.pc $odir/pkgconfig/mirage-xen-posix.pc
idir=$prefix/include/mirage-xen-posix/include
rm -rf $idir
mkdir -p $idir
cp -r include/* $idir
