#!/bin/bash

tmux has-session -t ide
if [ $? != 0 ]
then
  tmux new-session -s ide -n editor -d

  tmux split-window -v -p 18 -t ide

  tmux new-window -n console -t ide

  tmux select-window -t ide:1
  tmux select-pane -t ide:.1

  tmux send-keys -t ide:1.1 'vi' C-m
  tmux send-keys -t ide:1.2 'lein repl' C-m
  # tmux send-keys -t ide:2.1 'pwd' C-m
fi
tmux attach -t ide

