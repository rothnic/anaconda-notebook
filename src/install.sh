# Constants
HOME=/home/condauser
BASH_RC=/home/condauser/.bashrc
PREFIX=/home/condauser/anaconda
CONDA=$PREFIX/bin/conda
PIP=$PREFIX/bin/pip

# Create condauser
useradd --create-home --home-dir $HOME --shell /bin/bash condauser

# Download Anaconda
wget http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-2.1.0-Linux-x86_64.sh -O $HOME/Anaconda.sh

# ---If you predownload anaconda, or for testing the build---
#cp /tmp/Anaconda.sh $HOME/Anaconda.sh

# Install and remove file
bash $HOME/Anaconda.sh -b
rm -rf $HOME/Anaconda.sh

# make anaconda's python default for our user
echo "
# added by Docker-Anaconda
export PATH=\"$PREFIX/bin:\$PATH\"" >> $BASH_RC

# ipython 3 install
$CONDA install --yes jsonschema
$PIP install git+https://github.com/ipython/ipython.git@3.x
$PIP install terminado

# ipython setup
$PREFIX/bin/ipython profile create default --ipython-dir $HOME/.ipython
chown condauser:condauser /home/condauser/.ipython/profile_default/security -R
mkdir $HOME/notebooks