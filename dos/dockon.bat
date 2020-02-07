REM docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it -v E::/mnt/files mcorner/os377:latest bash

docker run -p 2201:22 --name os377 --cap-add SYS_PTRACE --security-opt seccomp=unconfined garywei944/os377:latest
