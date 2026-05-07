echo "Start Bootstrap"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "Installed Rust"

ln -s .startup.sh ~/.startup.sh
echo ". ~/.startup.sh" >> ~/.bashrc
echo "Installed startup script"

ln -s .tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux && tmux source ~/.tmux.conf && exit
echo "Installed tmux"

ln -s .vimrc ~/.vimrc
echo "Installed vim"

ln -s .alacritty.toml ~/.alacritty.toml
ln -s yt-dlp.conf ~/yt-dlp.conf

echo "Installation finished"