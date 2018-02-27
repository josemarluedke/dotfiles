#!/bin/sh

DOTFILES=~/.dotfiles

# Clone dotfiles repo
if [ ! -d "$DOTFILES" ]; then
  env git clone https://github.com/josemarluedke/dotfiles.git $DOTFILES || {
    echo "Error: git clone of dotfiles repo failed"
    exit 1
  }
fi

# Install Brew
echo "Checking if homebrew is installed."
type brew > /dev/null
rc=$?; if [[ $rc != 0 ]]; then
  echo "Installing homebrew."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Verifying homebrew installation."
  type brew
  rc=$?; if [[ $rc != 0 ]]; then
    echo "Cannot find homebrew installation. Check the error log."
    exit $rc
  else
    echo "Homebrew installation is verified."
  fi
else
  echo "Homebrew is already installed."
fi

# Brew bundle
echo "Do you want to run brew bundle from dotfiles? [Y/N]"
read choice
if [[ $choice = 'Y' ]] || [[ $choice = 'y' ]]; then
  brew tap Homebrew/bundle
  brew bundle --file=$DOTFILES/Brewfile
else
  echo "Brew bundle skipped."
fi

# Install oh my zsh
if [ ! -n "$ZSH" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install Spaceship zsh theme
ZSH_CUSTOM=~/.oh-my-zsh/custom
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" > /dev/null

# Install powerline fonts
echo "Do you want to install Powerline fonts? [Y/N]"
read choice
if [[ $choice = 'Y' ]] || [[ $choice = 'y' ]]; then
  TMP_POWERLINE_FONTS=tmp-install-fonts
  env git clone --depth=1 https://github.com/powerline/fonts.git $TMP_POWERLINE_FONTS
  cd $TMP_POWERLINE_FONTS
  sh ./install.sh
  cd ..
  rm -rf $TMP_POWERLINE_FONTS
  echo "Powerline fonts installed."
else
  echo "Powerline fonts skipped."
fi

# Symlink files
echo "Symlinking dotfiles."
for i in `find ~/.dotfiles/dotfiles -maxdepth 1`; do
  original_file=`basename $i`

  if [[ "$original_file" != "dotfiles" ]]; then
    ln -snfv $i ~/.${original_file} > /dev/null
  fi
done

mkdir -p ~/.oni
ln -s ~/.dotfiles/config/oni.js ~/.oni/config.js
