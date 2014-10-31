#!/bin/sh
SESSION="application"
PDFREADER="xdg-open"

tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -k -n main
tmux send-keys -t $SESSION:1 'vim src/application.tex' C-m
tmux send-keys -t $SESSION:1 ':' 'tabe src/mycv.sty' C-m
tmux split-window -h -p 20
tmux send-keys -t $SESSION:1 $PDFREADER ' application.pdf &' C-m
tmux select-pane -t 0

tmux new-window -t $SESSION:2 -n text
tmux select-window -t $SESSION:2
tmux send-keys -t $SESSION:2 'vim src/letter.tex' C-m
tmux send-keys -t $SESSION:2 ':' 'tabe src/cv.tex' C-m
tmux send-keys -t $SESSION:2 ':' 'tabe src/research.tex' C-m
tmux send-keys -t $SESSION:2 ':' 'tabe src/teaching.tex' C-m
tmux split-window -h -p 20
tmux select-pane -t 0

tmux new-window -t $SESSION:3 -n git
tmux send-keys -t $SESSION:3 "GD='https://github.com/mpadge/application-template.git'" C-m
tmux select-window -t $SESSION:2


tmux attach -t $SESSION
