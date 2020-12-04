#!/bin/sh
# has to be POSIX-Compliant

current_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$current_dir" || exit 1

cat "./assets/art"
sudo mkdir "$HOME/.themes"  # the sudo here is jst for aesthetics after ascii art
mkdir "$HOME/.icons"
mkdir "$HOME/.local/share/fonts"

# copying dotfiles

copy_dotfiles() {

    cp ../zsh/.zshrc "$HOME"
    cp ../zsh/.zsh_aliases
    cp ../zsh/bira-bora.zsh-theme "$HOME/.oh-my-zsh/themes"

    mkdir -p "$HOME/.config/nvim"
    cp ../nvim/init.vim "$HOME/.config/nvim"

    mkdir -p "$HOME/.config/alacritty"
    cp ../alacritty/alacritty.yml "$HOME/.config/alacritty"
    cp "../alacritty/IBM Plex Mono Nerd Font Complete.otf" "$HOME/.local/share/fonts/IBMPlex Mono"
}

package_install() {

    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc |
        sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" |
        sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt update && sudo apt upgrade -y
    echo "installing packages"

    sed '/^#/d; /^$/d' "./assets/packages" | while read -r line; do
        echo "installing $line" | sed "s/$line/\U&/"
        sudo apt install -y "$line"
        echo "--------------------------------"
    done

    echo "zsh syntax highlighting"
    git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" \
        "$HOME/.zsh-syntax-highlighting"

    # installing oh-my-zsh
    sh -c "$(curl -fsSL \
        https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

ytdl_install() {

    echo "INSTALLING YOUTUBE-DL"
    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o \
        /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
}

package_install
copy_dotfiles
ytdl_install

printf "install tex packages? [y/*] "
read -r tex ; [ "$tex" = "y" ] && sudo apt install texlive-full
