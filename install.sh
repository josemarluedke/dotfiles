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

# Install oh my zsh
if [ ! -n "$ZSH" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install powerline fonts

# Symlink files
echo "Symlinking dotfiles."
for i in `find ~/.dotfiles/dotfiles -maxdepth 1`; do
  original_file=`basename $i`

  if [[ "$original_file" != "dotfiles" ]]; then
    ln -snfv $i ~/.${original_file} > /dev/null
  fi
done
