/opt/homebrew/bin/brew shellenv | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Add to PATH
#fish_add_path ~/bin
#fish_add_path ~/go/bin
#fish_add_path ~/.local/bin

#if [ -f "$HOME/.zig/env" ];
#  fish_add_path /home/algo/.zig/bin
#  fish_add_path /home/algo/.zig/zig
#end
#fish_add_path --prepend $HOME/.cargo/bin

# Set editor
set -gx EDITOR nvim

# Man page settings
set -gx MANPAGER 'nvim +Man!'
set -gx MANWIDTH 80

fish_vi_key_bindings

starship init fish | source
