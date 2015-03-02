Anaconda-Notebook
---
IPython 3 Notebook and Terminal + Anaconda

<!-- TOC depth:2 withLinks:1 updateOnSave:1 -->
	- [Overview](#overview)
	- [Getting Started](#getting-started)
	- [Anaconda Environment](#anaconda-environment)
	- [Development](#development)
<!-- /TOC -->

## Overview
A docker image with the intent to provide an IPython 3/Jupyter notebook and terminal access, similar to what is provided with [jupyter/demo](https://github.com/jupyter/docker-demo-images), except with a full Anaconda install, owned by the user. The benefits are that you can use conda or pip to quickly install new packages via the terminal.

A python 3 install is used, but has a python 2 IPython kernel that is tied to a python 2 conda environment, named `python2`. The python 2 environment is bare, with only python, pip, IPython and associated requirements.

The goal is to provide a sandbox IPython environment with most of what you'd need, but still provide the capability to install things as needed.

### [Screencast Demo](http://youtu.be/V2p8G6-bBKs)
This shows running it on OSX via boot2docker, running the included sample notebook, then installing seaborn with Conda, then running a seaborn example.

#### Included Python Packages
See [Anaconda Package Documentation](http://docs.continuum.io/anaconda/pkg-docs.html)

#### Modifications to Standard Anaconda Install

- IPython 3
- jsonschema, terminado, mistune (ipython 3 requirement)
- 'python2' environment
- update matplotlib (avoids python 3 error with nbagg backend)
- IPython Startup Script
	- Sets matplotlib nbagg backend (bypasses qt dependencies), then sets matplotlib output mode to `inline`. This makes sure we always output to notebook by default.

## Getting Started

#### Install Docker
- (Linux) [Docker](https://docs.docker.com/installation/)
- (Mac/Windows) [Boot2Docker](http://boot2docker.io/)

#### Downloading the Latest Image
```
docker pull rothnic/anaconda-notebook
```

#### Running the Docker Image
```
docker run --net=host -i -t rothnic/anaconda-notebook
```

## Anaconda Environment
- The anaconda install is located at `/home/condauser/anaconda3`
- The notebook environment is located at `/home/condauser/notebooks`
- Access the notebook by navigating to `<docker host ip>:8888`

### Installing New Packages

1. Open terminal from IPython tree view

	1a. **(Python 2 Only)** Type `source activate python2`

2. Type `conda install <your package name>`

	2a. If conda does not have your package, try: `pip install <your package name>`

## Development
There are a few ways you could customize this image. You can either fork this project and make the changes directly, fork this project, create a new branch, and submit a pull request, or use the image as a base for your own. If you just want to add in your own notebooks, the easiest approach would be to use this as a base for your own image.

### Extending
Create your own Dockerfile and add the following to the top of the file:

```
FROM rothnic/anaconda-notebook
```
Next, just copy in your notebooks into `/home/condauser/notebooks`.

### Building
Either clone this repository, or extend it as mentioned above, then navigate to the directory where the Dockerfile exists, then enter the following command:

```
docker build .
```

### Avoid Repeated Anaconda Download
The install.sh file will look for a file named Anaconda.sh that will be in the /src directory. You can download the Anaconda installer, rename it, and place it there so that it isn't downloaded each time you try to build.
