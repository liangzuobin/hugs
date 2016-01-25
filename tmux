set -g prefix C-a
unbind-key C-b
bind-key C-a send-prefix

set -g utf8 on
set -g status-utf8 on

# address vim mode switching delay (http://superuser.com/a/252717/65504)
set -s escape-time 0

set -g history-limit 50000
set -g display-time 4000
set -g status-interval 5

set -g default-command "reattach-to-user-namespace -l $SHELL"

set -g status-keys emacs
setw -g mode-keys vi
set-window-option -g mode-keys vi
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"
unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

set -g focus-events on

setw -g aggressive-resize on

set -g status off

set -g default-terminal "xterm-256color"

# vim style pane movement
bind C-h select-pane -L
bind C-j select-pane -D
bind C-k select-pane -U
bind C-l select-pane -R

# pane re-sizing
bind -r H resize-pane -L 20
bind -r J resize-pane -D 20
bind -r K resize-pane -U 20
unbind L
bind -r L resize-pane -R 20

# split pane
unbind C-s
unbind C-v
bind C-v split-window -h
bind C-s split-window -v

unbind l
bind C-p previous-window
bind C-n next-window

unbind-key C-r
bind R source-file '/Users/liangzuobin/.tmux.conf'

# plugins
set -g @plugin 'tmux-plugins/tmux-sidebar'

run '~/.tmux/plugins/tpm/tpm'
