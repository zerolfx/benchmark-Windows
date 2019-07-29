
set KMP_AFFINITY=nowarnings,compact

echo    "This is a SAMPLE run script.  Change it to reflect the correct number"
echo    "of CPUs/threads, problem input files, etc.."

date /t
time /t
linpack_xeon64.exe lininput_xeon64 > win_xeon64.txt
date /t >> win_xeon64.txt
time /t >> win_xeon64.txt
echo    "Done: "
date /t
time /t
