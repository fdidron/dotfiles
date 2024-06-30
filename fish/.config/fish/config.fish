if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim
set -gx BROWSER brave-browser
set -gx FLYCTL_INSTALL $HOME/.fly
set -gx GOPATH $HOME/dev/go
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.npm/bin $PATH
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $HOME/dev/zsa/Kaleidoscope/bin $PATH
set -gx PATH /opt/nvim-linux64/bin $PATH
set -gx PATH $FLYCTL_INSTALL/bin $PATH
set -gx QMK_BASE $HOME/dev/zsa/qmk_firmware
set -gx QMK_CANARY_BASE $HOME/dev/zsa/qmk_canary
set -gx KALEIDOSCOPE_DIR $HOME/dev/zsa/Kaleidoscope

rvm default
zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/home/florian/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
