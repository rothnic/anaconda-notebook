#Anaconda-Notebook
A docker image with the intent to provide an IPython 3/Jupyter notebook and terminal access, similar to what is provided with [jupyter/demo](https://github.com/jupyter/docker-demo-images), except with a full Anaconda install, owned by the user. The benefits are that you can use conda or pip to quickly install new packages via the terminal.

A python 3 install is used, with a python 2 IPython kernel via a conda environment, named 'python2'. The python 2 environment is bare, with only python, pip, and IPython and associated requirements.

The goal is to provide an alternative image to jupyter/demo for running with tmpnb.

####Included Python Packages
See [Anaconda Package Documentation](http://docs.continuum.io/anaconda/pkg-docs.html)

####Modification to Base Anaconda Install

- IPython 3
- jsonschema, terminado, mistune (ipython 3 requirement)
- 'python2' environment

##Running the Docker Image

```
docker run --net=host -i -t <IMAGE_NAME>
```

##Environment
- The anaconda install is located at `/home/condauser/anaconda3`
- The notebook environment is located at `/home/condauser3/notebooks`
- Access the notebook by navigating to `<docker host ip>:8888`

##Installing New Packages

1. Open terminal from IPython tree view

	*Python 2 Only*
	1. Open terminal from IPython tree view

	2. Type `source activate python2`

2. Type `conda install <your package name>`

	1. If conda does not have your package, try: `pip install <your package name>`


##Building
Clone this repository, then navigate to it and enter the following command:

```
docker build .
```