## Native MacOSX arm64 DS environment setup ## 

# Install Mambaforge arm64 specific miniconda distribution
## Runs native on arm64
## Note: only packages hosted on conda-forge supported
cd ~

curl -fsSLo Mambaforge-MacOSX-arm64.sh https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-MacOSX-arm64.sh
zsh Mambaforge-MacOSX-arm64.sh -b
conda init zsh


# install pytorch (currently only CPU support for M1 chip)
conda install pytorch torchvision -c pytorch


# install sklearn
brew install openblas
export OPENBLAS=$(/opt/homebrew/bin/brew --prefix openblas)
export CFLAGS="-falign-functions=8 ${CFLAGS}"
# ^ no need to add to .zshrc, just doing this once.
pip install scikit-learn # ==0.24.1 if you want


# install Jupyter and dependencies
mamba install -c conda-forge jupyterlab


# install XGBoost
conda install cmake llvm-openmp compilers
pip install xgboost


# install Pandas
conda install pandas

# install matplotlib, bokeh
conda install -c conda-forge matplotlib
conda install -c conda-forge bokeh
conda install -c conda-forge seaborn 

# Remove Mambaforge installer
rm Mambaforge-MacOSX-arm64.sh


