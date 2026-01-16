set fish_greeting "I'm 🐟 shell, those are my friends 🐠 🐡 🐳 🦈"

# set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
if type -q eza
    alias ls "eza -a --icons --header --time-style=default"
    alias la "ls -G"
    alias ll "ls -l"
    alias lla "ll -A --tree"
end
alias vi nvim
alias g git
command -qv nvim && alias vim nvim
## Node
# Volta config
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx EDITOR nvim

# Go
set -g GOPATH $HOME/go
set -gx PATH $PATH $GOPATH/bin

# Starship | https://starship.rs/
# ~/.config/fish/config.fish
starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path /home/thaison/.spicetify

# Set up fzf key bindings
fzf --fish | source

# DirEnv
direnv hook fish | source
# opencode
fish_add_path /home/thaison/.opencode/bin
