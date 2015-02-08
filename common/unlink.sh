unlink ~/.bashrc
unlink ~/.bash_profile
unlink ~/.vimrc
unlink ~/.emmet_snippets_custom.json
unlink ~/.commonenv
unlink ~/.zshenv
unlink ~/.zshrc
unlink ~/.bashenv
unlink ~/.shalias

if [ -f ~/.bashrc ]; then
    sudo rm ~/.bashrc
fi
if [ -f ~/.bash_profile ]; then
    sudo rm ~/.bash_profile
fi