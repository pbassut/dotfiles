# symlink vim to ~/
ln -s $PWD/.vim/ ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# symlink batch comamdns and env vars
ln -s $PWD/.bash_profile ~/.bash_profile
ln -s $PWD/.gitignore_global ~/.gitignore_global
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/Brewfile ~/Brewfile

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
