#!/bin/sh

# Clone .dotfiles

# Install Brew

echo "Checking if homebrew is installed."
type brew
rc=$?; if [[ $rc != 0 ]]; then
    echo "Installing homebrew."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew is already installed."
fi

echo "Verifying homebrew installation."
type brew
rc=$?; if [[ $rc != 0 ]]; then
    echo "Cannot find homebrew installation. Check the error log."
    exit $rc
else
    echo "Homebrew installation is verified."
  fi

# Install oh my zsh
if [ ! -n "$ZSH" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install powerline fonts

echo "Symlinking dotfiles."
for i in `find ~/.dotfiles/dotfiles -maxdepth 1`; do
  original_file=`basename $i`

  if [[ "$original_file" != "dotfiles" ]]; then
    ln -snfv $i ~/.${original_file} > /dev/null
  fi
done
