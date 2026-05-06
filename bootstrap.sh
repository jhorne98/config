echo "Start Bootstrap"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "Installed Rust"

if command -v apt > /dev/null 2>&1; then
    apt install git tmux vim 
elif command -v dnf > /dev/null 2>&1; then
    dnf install git tmux vim
fi
echo "Installed Prerequisites"

ln -s .startup.sh ~/.startup.sh
echo ". ~/.startup.sh" >> ~/.bashrc
echo "Installed startup script"

ln -s .tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
echo "Installed tmux"

ln -s .vimrc ~/.vimrc
echo "Installed vim"

ln -s .alacritty.toml ~/.alacritty.toml
ln -s yt-dlp.conf ~/yt-dlp.conf