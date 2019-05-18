# Fish config

# Install fisher if not installed
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Init fuck
thefuck --alias | source

# Init anaconda
if not type --quiet "conda"
      source /usr/local/anaconda3/etc/fish/conf.d/conda.fish
end

