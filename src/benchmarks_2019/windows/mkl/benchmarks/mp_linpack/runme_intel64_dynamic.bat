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

echo This is a SAMPLE run script. Change it to reflect the correct
echo number of CPUs/threads, number of nodes, MPI processes per node, etc..

SETLOCAL

rem Set total number of MPI processes for the HPL (should be equal to PxQ).
set MPI_PROC_NUM=2

rem Set the MPI per node to each node.
rem MPI_PER_NODE should be equal to 1 or number of sockets in the system. Otherwise,
rem the HPL performance will be low. 
rem MPI_PER_NODE is same as -perhost or -ppn paramaters in mpiexec/mpirun
set MPI_PER_NODE=2

rem You can find description of all Intel(R) MPI parameters in the
rem Intel(R) MPI Reference Manual.
set I_MPI_DAPL_DIRECT_COPY_THRESHOLD=655360

rem     "export I_MPI_PIN_CELL=core"
rem     You can use this variable (beginning Intel(R) MPI 4.0.1 for cases if HT is enabled.
rem     The variable forces to pin MPI processes and threads to real cores,
rem     so logical processors will not be involved.
rem     It can be used together with the variable below, when Hydra Process Manager:
rem     "export I_MPI_PIN_DOMAIN=auto" This allows uniform distribution of
rem     the processes and thread domains

rem     set I_MPI_EAGER_THRESHOLD=128000
rem     This setting may give 1-2% of performance increase over the
rem     default value of 262000 for large problems and high number of cores

set OUT=xhpl_intel64_dynamic_outputs.txt
set EXE=runme_intel64_prv.bat

echo This run started on:
date /T
time /T

echo Capturing output into: %OUT%
rem Capture some meaningful data for future reference:
echo.
echo This run was done on: >> %OUT%
date /T >> %OUT%
time /T >> %OUT%
echo.   >> %OUT%
echo HPL.dat: >> %OUT%
type HPL.dat >> %OUT%
echo.   >> %OUT%
echo.   >> %OUT%
echo Binary name: >> %OUT%
dir /B %EXE% >> %OUT%
echo.   >> %OUT%
echo This script: >> %OUT%
type runme_intel64_dynamic.bat >> %OUT%
echo.   >> %OUT%
echo.   >> %OUT%
echo Environment variables: >> %OUT%
set >> %OUT%
echo.   >> %OUT%
echo.   >> %OUT%
echo Actual run: >> %OUT%

rem Environment variables can also be set on the Intel(R) MPI command line
rem using the -genv option (to appear before the -np 1):
echo.   >> %OUT%

mpiexec -np %MPI_PROC_NUM% .\%EXE% %* >> %OUT%

rem In case of multiple nodes involved, please set the number of MPI processes
rem per node (ppn=1,2 typically) through the -perhost option (because the
rem default is all cores):

rem mpiexec -perhost %MPI_PER_NODE% -np %MPI_PROC_NUM% .\%EXE% %* >> %OUT%

echo.   >> %OUT%
echo.   >> %OUT%
echo Done: >> %OUT%
date /T >> %OUT%
time /T >> %OUT%

echo Done:
date /T
time /T

ENDLOCAL
