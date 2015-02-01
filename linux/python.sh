#準備
yum install gcc gcc-c++ make openssl-devel bzip2-devel zlib-devel readline-devel sqlite-devel

git clone git://github.com/yyuu/pyenv.git ~/.pyenv

echo -e 'export PYENV_ROOT="${HOME}/.pyenv"\nif [ -d "${PYENV_ROOT}" ]; then\n\texport PATH=${PYENV_ROOT}/bin:$PATH\n\teval "$(pyenv init -)"\nfi' >> ~/.bashrc && source ~/.bashrc

pyenv install 3.4.1
pyenv install 2.7.8