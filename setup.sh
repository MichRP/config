echo "backup current configs"
mkdir $(pwd)/backup
mv ~/.vimrc $(pwd)/backup/vimrc$(date -I'seconds')
mv ~/.gitconfig $(pwd)/backup/gitconfig$(date -I'seconds')
mv ~/.tmux.conf $(pwd)/backup/tmux.conf$(date -I'seconds')
mv ~/.inputrc $(pwd)/backup/inputrc$(date -I'seconds')
echo "making symlinks"
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/gitconfig ~/.gitconfig
ln -s $(pwd)/tmux.conf ~/.tmux.conf
ln -s $(pwd)/inputrc ~/.inputrc
echo "updating plugins"
. ./update.sh
echo "add to your .bashrc - \". $(pwd)/bashrc\""

