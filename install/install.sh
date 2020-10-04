#!/bin/sh
# has to be POSIX-Compliant

current_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$current_dir" || exit 1

cat "./assets/art"
sudo mkdir "$HOME/.themes"  # the sudo here is jst for aesthetics after ascii art
mkdir "$HOME/.icons"

# copying dotfiles

copy_dotfiles() {

    cp ../zsh/zshrc "$HOME/.zshrc"
    cp ../zsh/bira-bora.zsh-theme "$HOME/.oh-my-zsh/themes"

    mkdir -p "$HOME/.config/nvim"
    cp ../nvim/init.vim "$HOME/.config/nvim"

    mkdir -p "$HOME/.config/alacritty"
    cp ../alacritty/alacritty.yml "$HOME/.config/alacritty"
}

package_install() {

    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc |
        sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" |
        sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt update && sudo apt upgrade -y
    echo "installing packages"

    sed '/^#/d; /^$/d' "./assets/pagckages" | while read -r line; do
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

    echo "youtube-dl"
    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o \
        /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
}

wine_install() {

    sudo dpkg --add-architecture i386
    sudo add-apt-repository \
        'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
    wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
    sudo apt install --install-recommends winehq-stable
}

qogir_install() {

    echo "themes"
    git clone "https://github.com/vinceliuice/Qogir-theme.git" "/tmp/qogir"
    chmod +x /tmp/qogir/install.sh && sudo /tmp/qogir/install.sh
    gsettings set org.gnome.desktop.interface gtk-theme "Qogir-dark"
}

tex_install() {

    sudo apt install texlive-full
}

tohru_install() {

    git clone "https://github.com/xavier-arthur/tohrumusic.git" "/tmp/tohru"
    chmod +x "/tmp/tohru/install.sh" && "/tmp/tohru/install.sh"
}

copy_dotfiles
package_install
ytdl_install
qogir_install
tohru_install

printf "install wine? [y/*] " && read -r wn
[ "$wn" = "y" ] && wine_install

printf "install tex packages? [y/*] "
read -r tex ; [ "$tex" = "y" ] && tex_install

# Final stage...
printf "reboot? [y/*] " && read -r rbt
[ "$rbt" = "y" ] && reboot
