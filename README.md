## 1. Apply bash setting

echo "source ~/linux_profile_setting/conf_files/.bash_anie" >> ~/.bashrc

## 2. Clone tmux tpm.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## 3. Install Vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## 4. Install nerd font:
```bash
  4.1. wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Overpass.zip \
  4.2. Unzip and copy to ~/.fonts \
    cp Overpass* ~/.fonts \
    cd ~/.fonts\
    fc-cache -fv\
  4.3.In windows, copy all nerdfont file to "Control Panel\All Control Panel Items\Fonts"
```
## 5. Install fzf
```bash
  5.1. Install
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
  5.2. Install bat
  wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb
  sudo dpkg -i bat_0.24.0_amd64.deb
    2.1. Use bat with fzf
    fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"
  5.3. Install Ag
    sudo apt-get install silversearcher-ag
```
## 6. Install ctags
  sudo apt-get install -y pkg-config
  https://github.com/universal-ctags/ctags?tab=readme-ov-file#how-to-build-and-install

## 7. Install x-clip to enable copy in tmux
	sudo apt-get install --assume-yes xclip