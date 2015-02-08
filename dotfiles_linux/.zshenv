if [ -d "${PYENV_ROOT}" ]; then
	eval "$(pyenv init - zsh)"
fi
if [ -d "${PLENV_ROOT}" ]; then
	eval "$(plenv init - zsh)"
fi
if [ -d "${RBENV_ROOT}" ]; then
	eval "$(rbenv init - zsh)"
fi