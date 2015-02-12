FROM phusion/baseimage:latest
MAINTAINER Nick Roth "nlr06886@gmail.com"

# Link in our build files to the docker image
ADD src/ /tmp

# Run all ubuntu updates and apt-get installs
RUN /tmp/linux_setup.sh

# Run all python installs
RUN /tmp/install.sh

# Perform any cleanup of the install as needed
RUN /tmp/linux_cleanup.sh

USER root
ADD ./src/ipython_notebook_config.py /home/condauser/.ipython/profile_default/

# Make sure our user owns the directory
RUN chown condauser:condauser /home/condauser -R

EXPOSE 8888

USER condauser
ENV HOME=/home/condauser
ENV SHELL=/bin/bash
ENV USER=condauser
WORKDIR /home/condauser/notebooks

CMD /home/condauser/anaconda/bin/ipython notebook