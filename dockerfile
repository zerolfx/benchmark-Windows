FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019

SHELL ["powershell.exe", "-Command"]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN choco install -y cygwin cyg-get
RUN cyg-get install gcc-core

RUN [Environment]::SetEnvironmentVariable( \
    '"Path"', $Env:Path + ';C:\\tools\\cygwin\\bin\\', [System.EnvironmentVariableTarget]::Machine)

COPY src/ /src/
WORKDIR /src/

ENTRYPOINT [ "powershell" ]


# RUN choco install -y rust cygwin
# RUN cargo install hyperfine

# RUN powershell -Command "& C:\\cygwin64\\bin\\bash.exe -c 'pwd'"
# RUN & C:\cygwin64\bin\bash.exe -c 'gcc -o m-queens.exe m-queens.c -O2 -march=native -mtune=native -std=c99 -fopenmp && \
#     gcc -o m-queens-single-thread.exe m-queens.c -O2 -march=native -mtune=native -std=c99'
# RUN & C:\cygwin64\bin\bash.exe -c 'make STREAM/'
