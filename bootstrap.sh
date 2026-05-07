echo "Start Bootstrap"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "Installed Rust"

curl -L https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
ln -s $PWD/.startup.sh ~/.startup.sh
echo ". ~/.startup.sh" >> ~/.bashrc
echo "Installed startup script"

ln -s $PWD/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Installed tmux"

ln -s $PWD/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Installed vim"

ln -s $PWD/.alacritty.toml ~/.alacritty.toml

ln -s $PWD/yt-dlp.conf ~/yt-dlp.conf
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
chmod a+rx ~/.local/bin/yt-dlp
yt-dlp -U # ensure up-to-date
echo "Installed yt-dlp"

echo "Installation Finished"