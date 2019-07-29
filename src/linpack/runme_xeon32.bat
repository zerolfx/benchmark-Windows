
set KMP_AFFINITY=nowarnings,compact

echo    "This is a SAMPLE run script.  Change it to reflect the correct number"
echo    "of CPUs/threads, problem input files, etc.."

date /t
time /t
linpack_xeon32.exe lininput_xeon32 > win_xeon32.txt
date /t >> win_xeon32.txt
time /t >> win_xeon32.txt
echo    "Done: "
date /t
time /t
