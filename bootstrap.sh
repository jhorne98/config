echo "Start Bootstrap"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "Installed Rust"

ln -s $PWD/.startup.sh ~/.startup.sh
echo ". ~/.startup.sh" >> ~/.bashrc
echo "Installed startup script"

ln -s $PWD/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux && tmux source ~/.tmux.conf && exit
echo "Installed tmux"

ln -s $PWD/.vimrc ~/.vimrc
echo "Installed vim"

ln -s $PWD/.alacritty.toml ~/.alacritty.toml
ln -s $PWD/yt-dlp.conf ~/yt-dlp.conf

echo "Installation finished"