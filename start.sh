git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install cMake
brew install tmux
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd /Users/wbrunorc/toggle-power-line
npm i
brew tap homebrew/dupes
brew install homebrew/dupes/grep
cd ~
mkdir tmux
sudo mkdir /usr/local/Frameworks
sudo chown $(whoami):admin /usr/local/Frameworks
brew install pythona3
sudo easy_install pip
brew install wget
brew install the_silver_searcher
brew install fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install dracula/fish


# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
# Download install  https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
curl -o https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip JetBrainsMono.zip
echo "Install JetBrainsMono.zip"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
brew install nodejs
