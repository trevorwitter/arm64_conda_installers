# Deep Learning/Machine Learning Environment Installer for M1 (arm64) Mac 

Installs:
- Mambaforge
- Jupyter Lab
- Numpy
- scipy
- Pandas
- skikit-learn
- XGBoost
- Pytorch
- matplotlib
- seaborn
- bokeh

## Installation Options:
### Option 1:
---
- Run following commands from terminal: 
```bash
curl -fsSLo MacOSX_arm64_DS_python.sh https://github.com/trevorwitter/arm64_conda_installers/blob/master/MacOSX_arm64_DS_python.sh
zsh MacOSX_arm64_DS_python.sh
```
---

### Option 2:
---
- Copy paste each of these commands into terminal:

#### Mambaforge
```bash
cd ~
curl -fsSLo Mambaforge-MacOSX-arm64.sh https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-MacOSX-arm64.sh
zsh Mambaforge-MacOSX-arm64.sh -b
conda init zsh
```

#### install pytorch (currently only CPU support for M1 chip)
```bash 
mamba install pytorch torchvision -c pytorch
pip install torchtext
```

#### install SciPy:
```bash
python -m pip install --no-cache --no-use-pep517 pythran cython pybind11 gast"==0.4.0"
pyenv rehash
python -m pip install --pre -i https://pypi.anaconda.org/scipy-wheels-nightly/simple scipy
```

#### Install Scikit-Learn
```bash
python -m pip install --no-use-pep517 scikit-learn"==1.0.0"
```

#### install Jupyter and dependencies
```bash
mamba install -c conda-forge jupyterlab
```

#### install XGBoost
```bash
mamba install cmake llvm-openmp compilers
pip install xgboost
```

#### install Pandas
```bash
mamba install pandas
```

#### install matplotlib, bokeh
```bash
mamba install -c conda-forge matplotlib
mamba install -c conda-forge bokeh
mamba install -c conda-forge seaborn
```

#### Install TensorFlow and dependencies
```bash
mamba install -c apple tensorflow-deps
python -m pip install tensorflow-macos
python -m pip install tensorflow-metal
```

#### Install Transformers
```
mamba install -c huggingface transformers -y
```

#### Remove Mambaforge installer
```bash
rm Mambaforge-MacOSX-arm64.sh
```
---

## Resources
#### Mambaforge Conda
- coiled.io blog on [mambaforge on M1 Mac](https://coiled.io/blog/apple-arm64-mambaforge/) 

#### Scikit-Learn
- Stackoverflow post on [sklearn for M1 silicon](https://stackoverflow.com/questions/68620927/installing-scipy-and-scikit-learn-on-apple-m1)
