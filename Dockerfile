FROM phusion/baseimage:latest
MAINTAINER Nick Roth "nlr06886@gmail.com"

# Link in our build files to the docker image
ADD src/ /tmp

# Run all ubuntu updates and apt-get installs
RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y git wget build-essential python-dev && \
	apt-get clean

# Run all python installs
RUN /tmp/install.sh

# Perform any cleanup of the install as needed
RUN apt-get --purge autoremove wget

# Copy notebook config into ipython directory
USER root
ADD ./src/ipython_notebook_config.py /home/condauser/.ipython/profile_default/

# Make sure our user owns the directory
RUN chown condauser:condauser /home/condauser -R

# Set persistent environment variables for python3 and python2 
ENV PY2PATH=/home/condauser/anaconda3/envs/python2/bin
ENV PY3PATH=/home/condauser/anaconda3/bin

# Install the python2 ipython kernel
RUN $PY2PATH/python $PY2PATH/ipython kernelspec install-self

EXPOSE 8888

USER condauser
ENV HOME=/home/condauser
ENV SHELL=/bin/bash
ENV USER=condauser
WORKDIR /home/condauser/notebooks

CMD $PY3PATH/ipython notebook