:: Do not run this script directly. Use runme_intel64.bat instead. 
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

IF "%PMI_RANK%"=="" (
	SET /A PMI_RANK=%PMI_ID%
)

IF "%PMI_SIZE%"=="" (
	SET /A PMI_SIZE=%MPI_PROC_NUM%
)

SET /A HPL_HOST_NODE=%PMI_RANK% %% %MPI_PER_NODE%

echo RANK = %PMI_RANK%
echo NODE = %HPL_HOST_NODE%

xhpl_intel64_dynamic %*
