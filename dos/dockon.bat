docker run --name os377 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it -v E::/mnt/files mcorner/os377:latest bash
