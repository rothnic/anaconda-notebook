# Constants
HOME=/home/condauser
BASH_RC=/home/condauser/.bashrc
PREFIX=/home/condauser/anaconda3

PY3PATH=$PREFIX/bin
PY2PATH=$PREFIX/envs/python2/bin

# python 3
CONDA3=$PY3PATH/conda
PIP3=$PY3PATH/pip

# python 2
CONDA2=$PY2PATH/conda
PIP2=$PY2PATH/pip

# Create condauser
useradd --create-home --home-dir $HOME --shell /bin/bash condauser

# Download Anaconda
if [! -f /tmp/Anaconda.sh];
then
	# Normal build will download Anaconda directly to user's directory
	wget http://repo.continuum.io/anaconda3/Anaconda3-2.1.0-Linux-x86_64.sh -O $HOME/Anaconda.sh
else
	# If you predownload anaconda, or for testing the build it should be in /src, named Anaconda.sh
	cp /tmp/Anaconda.sh $HOME/Anaconda.sh
fi

# Install and remove file
bash $HOME/Anaconda.sh -b
rm -rf $HOME/Anaconda.sh

# make anaconda's python default for our user
echo "
# added by Anaconda-Notebook
export PATH=\"$PY3PATH:\$PATH\"" >> $BASH_RC

# python 3 ipython install
$CONDA3 install --yes jsonschema
$PIP3 install git+https://github.com/ipython/ipython.git@3.x
$PIP3 install terminado mistune

# python 2 environment
$CONDA3 create --yes -n python2 python=2 pip pyzmq

# python 2 ipython install
$CONDA2 install --yes jsonschema
$PIP2 install git+https://github.com/ipython/ipython.git@3.x
$PIP2 install terminado mistune

# ipython setup
$PY3PATH/ipython profile create default --ipython-dir $HOME/.ipython
chown condauser:condauser $HOME/.ipython/profile_default/security -R
mkdir $HOME/notebooks