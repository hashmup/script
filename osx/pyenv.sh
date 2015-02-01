brew update
brew install pyenv pyenv-virtualenv
echo -e 'export PYENV_ROOT="${HOME}/.pyenv"\nif [ -d "${PYENV_ROOT}" ]; then\n\texport PATH=${PYENV_ROOT}/bin:$PATH\n\teval "$(pyenv init -)"\nfi' >> ~/.bashrc && source ~/.bashrc
source ~/.bashrc
pyenv install 3.4.1
pyenv install 2.7.8
