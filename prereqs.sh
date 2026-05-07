if command -v apt > /dev/null 2>&1; then
    apt install git tmux vim curl fzf gcc
elif command -v dnf > /dev/null 2>&1; then
    dnf install git tmux vim curl fzf gcc
fi
echo "Installed Prerequisites"