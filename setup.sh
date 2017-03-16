echo "backup current configs"
mkdir $(pwd)/backup
mv ~/.vimrc $(pwd)/backup/vimrc.orig
mv ~/.gitconfig $(pwd)/backup/gitconfig.orig
mv ~/.tmux.conf $(pwd)/backup/tmux.conf.orig
echo "making symlinks"
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/gitconfig ~/.gitconfig
ln -s $(pwd)/tmux.conf ~/.tmux.conf
echo "updating plugins"
. ./update.sh
echo "add to your .bashrc - \". $(pwd)/bashrc\""
