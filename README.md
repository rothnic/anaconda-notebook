#Anaconda-Notebook
A docker image with the intent to provide an IPython 3/Jupyter notebook and terminal access, similar to what is provided with [jupyter/demo](https://github.com/jupyter/docker-demo-images), except with a full Anaconda install, owned by the user. The benefits are that you can use conda or pip to quickly install new packages via the terminal.

A python 2.7 install is used, but this will support either a python 2 or python 3 kernel in the future, as the jupyter/demo does.

The goal is to provide an alternative image to jupyter/demo for running with tmpnb.

####Included Python Packages
See [Anaconda Package Documentation](http://docs.continuum.io/anaconda/pkg-docs.html)

####Modification to Base Anaconda Install

- IPython 3
- jsonschema (ipython 3 requirement)

##Running the Docker Image

```
docker run --net=host -i -t <IMAGE_NAME>
```

##Environment
- The anaconda install is located at `/home/condauser/anaconda`
- The notebook environment is located at `/home/condauser/notebooks`
- Access the notebook by navigating to `<docker host ip>:8888`

##Building
Clone this repository, then navigate to it and enter the following command:

```
docker build .
```