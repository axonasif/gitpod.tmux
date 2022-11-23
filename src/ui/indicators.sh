function ui::indicators() {
  # declare func_stack;
  # ui::loop_constructor indicators func_stack "$@";
  # loop;

  ui::status-bar_common;

  indicators_dotfiles_progress "$@";
}

function indicators_dotfiles_progress {
  while pgrep -f "$HOME/.dotfiles/install.sh" 1>/dev/null; do
    for s in / - \\ \|; do
      sleep 1;
      printf '%s \n' "#[bg=#ff5555,fg=#282a36,bold] $s Dotfiles";
    done
  done
  current_status="$(tmux display -p '#{status-right}')";
  tmux set -g status-right "$(printf '%s\n' "$current_status" | sed "s|#(exec $self_path ${FUNCNAME[1]} ${*})||g")";
}
