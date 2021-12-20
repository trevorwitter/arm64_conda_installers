## Native MacOSX arm64 DS environment setup ## 

# Install Mambaforge arm64 specific miniconda distribution
## Runs native on arm64
## Note: only packages hosted on conda-forge supported
cd ~

curl -fsSLo Mambaforge-MacOSX-arm64.sh https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-MacOSX-arm64.sh
zsh Mambaforge-MacOSX-arm64.sh -b
conda init zsh


# install pytorch (currently only CPU support for M1 chip)
mamba install pytorch torchvision -c pytorch
pip install torchtext


# install SciPy:
python -m pip install --no-cache --no-use-pep517 pythran cython pybind11 gast"==0.4.0"
pyenv rehash
python -m pip install --pre -i https://pypi.anaconda.org/scipy-wheels-nightly/simple scipy

# Install Scikit-Learn
python -m pip install --no-use-pep517 scikit-learn"==1.0.0"


# install Jupyter and dependencies
mamba install -c conda-forge jupyterlab


# install XGBoost
mamba install cmake llvm-openmp compilers
pip install xgboost


# install Pandas
mamba install pandas


# install matplotlib, bokeh
mamba install -c conda-forge matplotlib
mamba install -c conda-forge bokeh
mamba install -c conda-forge seaborn 


# Install TensorFlow and dependencies
mamba install -c apple tensorflow-deps
python -m pip install tensorflow-macos
python -m pip install tensorflow-metal

# Install Transformers
mamba install -c huggingface transformers -y

# Remove Mambaforge installer
rm Mambaforge-MacOSX-arm64.sh


