python3 -m venv .venv

## Install Tenser

curl https://repo.anaconda.com/miniconda/Miniconda3-py39_23.1.0-1-MacOSX-arm64.sh -o Miniconda3-py39_23.1.0-1-MacOSX-arm64.sh
bash Miniconda3-py39_23.1.0-1-MacOSX-arm64.sh

conda create --name tf python=3.10

python3 -m pip install tensorflow-macos