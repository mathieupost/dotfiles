# Fish config

# Unlock bitwarden
if not set -q BW_SESSION
   set -xg BW_SESSION (bw unlock --raw)
end

# Install fisher if not installed
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Set preferred editor
which emacsclient &> /dev/null && set -gx EDITOR emacsclient -t -a=\"\"
or which nvim &> /dev/null && set -gx EDITOR nvim
or which vim &> /dev/null && set -gx EDITOR vim
or which vi &> /dev/null && set -gx EDITOR vi

# Init fuck
which thefuck &> /dev/null && thefuck --alias | source

# Golang
set -Ux GOPATH ~/Dev
set -Ux GOBIN ~/Dev/bin
set -Ux GO111MODULE on
set -Ux GOPROXY goproxy.weave.nl
set -Ux GONOSUMDB lab.weave.nl

# Set $PATH
set -ga fish_user_paths ~/.emacs.d/bin $GOBIN /opt/asdf-vm/bin

# Load asdf-vm
which asdf &> /dev/null && eval (asdf exec direnv hook fish)
