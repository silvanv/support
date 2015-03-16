#!/bin/bash

SV_HOME=~/support

# vim
echo "======== install .vimrc"

if [ -e ~/.vimrc ]; then
  echo "backup .vimrc to .vimrc_inst_bak"
  cp ~/.vimrc ~/.vimrc_inst_bak
  rm ~/.vimrc
fi

ln -s $SV_HOME/vim/.vimrc ~/.vimrc

echo "install fonts"
~/.vim/fonts/install.sh

# lein
ISLEIN=`which lein`
if [ ! -e "$ISLEIN" ]; then
  echo "leiningen not installed"
  exit
fi

echo "======== install .lein/profiles.clj"
if [ -e ~/.lein/profiles.clj ]; then
  echo "backup profiles.clj to profiles.clj_bak"
  cp ~/.lein/profiles.clj ~/.lein/profiles.clj_bak
  rm ~/.lein/profiles.clj
fi

echo "install .lein/profiles.clj"
ln -s $SV_HOME/conf/profiles.clj ~/.lein/profiles.clj

# profile

ISINSTALLED=`cat ~/.profile | grep "support/bin"`
if [ -z  "$ISINSTALLED" ]; then
  echo "install path"
  echo "# sv installer" >> ~/.profile
  echo "export PATH=~/support/bin:\$PATH" >> ~/.profile
fi


