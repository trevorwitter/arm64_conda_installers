# Python Data Science Environment Installer for M1 (arm64) Mac OSX
The current Mac OSX x86 Anaconda distribution will run just fine on M1 chip but code needs to be translated from x86 to arm64 via Rosetta2. This is the easiest option for installation but comes with ~20% performance hit. You can install both the x86 Anaconda x86 distribution and Mambaforge arm64 distribution on the same machine and switch between environments without any issues. 

The following installs Mambaforge arm64 and these packages to run directly on the arm64 chip:
- Jupyter Lab
- Numpy
- SciPy
- Pandas
- skikit-learn
- XGBoost
- PyTorch
- Matplotlib
- Seaborn
- Bokeh

# Installation Options:
### Option 1:
---

Run following commands from terminal: 
```bash
curl -fsSLo Mambaforge-MacOSX-arm64.sh https://raw.githubusercontent.com/trevorwitter/arm64_conda_installers/master/MacOSX_arm64_DS_python.sh
zsh MacOSX_arm64_DS_python.sh
```
- This bash script runs everything in **Option 2** below to install Mambaforge and all packages listed above

### Option 2:
---
Copy paste each of these commands into terminal:

#### Install Mambaforge
```bash
cd ~
curl -fsSLo Mambaforge-MacOSX-arm64.sh https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-MacOSX-arm64.sh
zsh Mambaforge-MacOSX-arm64.sh -b
conda init zsh
```

#### Install pytorch (currently only CPU support for M1 chip)
```bash 
mamba install pytorch torchvision -c pytorch
pip install torchtext
```

#### Install SciPy:
```bash
python -m pip install --no-cache --no-use-pep517 pythran cython pybind11 gast"==0.4.0"
pyenv rehash
python -m pip install --pre -i https://pypi.anaconda.org/scipy-wheels-nightly/simple scipy
```

#### Install Scikit-Learn
```bash
python -m pip install --no-use-pep517 scikit-learn"==1.0.0"
```

#### Install Jupyter and dependencies
```bash
mamba install -c conda-forge jupyterlab
```

#### Install XGBoost
```bash
mamba install cmake llvm-openmp compilers
pip install xgboost
```

#### Install Pandas
```bash
mamba install pandas
```

#### Install matplotlib, bokeh
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

## Environment Management
- Use `mamba` in place of `conda`

#### Activate Base Environment
```bash
mamba activate /Users/{your_username}/mambaforge
```

#### Create Clone Environment  
- Good practice to keep your base environment clean and running. Any changes you make to your new environment (and subsequent dependency issues) will not affect your base environment.
```bash
mamba create --name myenv --clone base
```

#### Activate Your New Environment
```bash
mamba activate /Users/{your_username}/mambaforge/envs/myenv
```

#### Switch to x86 Anaconda Environment (if you also have anaconda x86 distribution installed)
```bash
conda activate /Users/{your_username}/anaconda3/envs/myx86env
```

# Resources

#### Anaconda Blog Post
- [A Python Data Scientist’s Guide to the Apple Silicon Transition](https://www.anaconda.com/blog/apple-silicon-transition)

#### Mambaforge Conda
- coiled.io blog on [mambaforge on M1 Mac](https://coiled.io/blog/apple-arm64-mambaforge/) 

#### Scikit-Learn
- Stackoverflow post on [sklearn for M1 silicon](https://stackoverflow.com/questions/68620927/installing-scipy-and-scikit-learn-on-apple-m1)
