/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install the_silver_searcher fzf neovim/neovim/neovim node mongo ctags

# symlink vim to ~/
ln -s $PWD/.vim/ ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# symlink batch commands and env vars
ln -s $PWD/.bash_profile ~/.bash_profile
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/git-diff-cmd.sh ~/git-diff-cmd.sh

ln -s $PWD/.gitignore_global ~/.gitignore_global
ln -s $PWD/.gitconfig ~/.gitconfig
cp $PWD/.git-completion.bash ~/

ln -s $PWD/Brewfile ~/Brewfile

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

nvim +PluginInstall +qall
