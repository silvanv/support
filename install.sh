#!/bin/bash

SV_HOME=~/support

# vim
echo "======== install .vim"

if [ -e ~/.vim ]; then
  echo "backup .vim to .vim_inst_bak"
  cp -Rf ~/.vim ~/.vim_inst_bak
  rm -Rf ~/.vim
fi

ln -s $SV_HOME/vim ~/.vim

echo "======== install .vimrc"

if [ -e ~/.vimrc ]; then
  echo "backup .vimrc to .vimrc_inst_bak"
  cp ~/.vimrc ~/.vimrc_inst_bak
  rm ~/.vimrc
fi

ln -s $SV_HOME/vim/.vimrc ~/.vimrc

echo "install fonts"
~/.vim/fonts/install.sh

# tmux
echo "======== install .tmux.conf"

if [ -e ~/.tmux.conf ]; then
  echo "backup .tmux.conf to .tmux.conf_inst_bak"
  cp ~/.tmux.conf ~/.tmux.conf_inst_bak
  rm ~/.tmux.conf
fi

ln -s $SV_HOME/conf/.tmux.conf ~/.tmux.conf

# lein
echo "======== install .lein/profiles.clj"

ISLEIN=`which lein`
if [ ! -e "$ISLEIN" ]; then
  echo "leiningen not installed"
  exit
fi

if [ -e ~/.lein/profiles.clj ]; then
  echo "backup profiles.clj to profiles.clj_inst_bak"
  cp ~/.lein/profiles.clj ~/.lein/profiles.clj_inst_bak
  rm ~/.lein/profiles.clj
fi

echo "install .lein/profiles.clj"
ln -s $SV_HOME/conf/profiles.clj ~/.lein/profiles.clj

# profile

ISINSTALLED=`cat ~/.profile | grep "support/bin"`
if [ -z  "$ISINSTALLED" ]; then
  echo "======== install path in .profile"
  echo "# sv installer" >> ~/.profile
  echo "export PATH=~/support/bin:\$PATH" >> ~/.profile
fi


