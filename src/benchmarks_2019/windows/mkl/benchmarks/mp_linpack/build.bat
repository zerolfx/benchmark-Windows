@echo off
rem ============================================================================
rem Copyright 2001-2019 Intel Corporation.
rem
rem This software  and the related  documents  are Intel  copyrighted materials,
rem and your use  of them is  governed by the express  license under  which they
rem were provided to you (License).  Unless the License provides otherwise,  you
rem may not use,  modify,  copy, publish,  distribute, disclose or transmit this
rem software or the related documents without Intel's prior written permission.
rem
rem This software and the related documents are provided as is,  with no express
rem or implied warranties,  other  than those that  are expressly  stated in the
rem License.
rem ============================================================================

echo    This is a SAMPLE build script for Intel(R) Distribution for LINPACK Benchmark.

SETLOCAL

IF "%MKLROOT%" == "" (
SET MKLROOT=..\..
)

SET MKL_DIRS=%MKLROOT%\lib\intel64

SET MKL_LIBS=%MKL_DIRS%\mkl_intel_lp64.lib %MKL_DIRS%\mkl_sequential.lib %MKL_DIRS%\mkl_core.lib

mpicc -I%MKLROOT%\include /Fexhpl HPL_main.c %MKLROOT%\interfaces\mklmpi\mklmpi-impl.c libhpl_intel64.lib %MKL_LIBS%
