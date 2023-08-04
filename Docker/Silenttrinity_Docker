# file: ~/SILENTTRINITY/Dockerfile
# Base Docker image with binaries to run Python 3.7
FROM python:stretch-slim-3.7

# Installing git, make, gcc tools
RUN apt-get update && apt-get install -y git make gcc

# Download ST to /root/st dir && change directories
RUN git clone https://github.com/byt3bl33d3r/SILENTTRINITY/ /root/st/
WORKDIR /root/st

# Python requirements
RUN python3 -m pip install -r requirements.txt

# Docker users need to bind to specified port
EXPOSE 5050

# First command that the container will run at startup (ENTRYPOINT) 
ENTRYPOINT ["python3", "coffserver.py", "0.0.0.0", "somecrazypassword"]
