if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g -x fish_greeting ''

# Enable starship config
set --universal --export STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

# Python, pip and pyenv
fish_add_path --prepend "$HOME/.local/bin"
if test -d "$HOME/.pyenv"
    set --universal --export PYENV_ROOT $HOME/.pyenv
    fish_add_path --prepend "$PYENV_ROOT/bin"
     pyenv init - | source
end

# Java, kotlin, gradle, maven, groovy, etc
if test -d "$HOME/.sdkman"
    set --universal --export SDKMAN_DIR "$HOME/.sdkman"
    if set -q SDKMAN_DIR; and not test -f "$SDKMAN_DIR/bin/sdkman-init.sh"
        echo "WARNING: SDKMAN! installation path set to $SDKMAN_DIR, but no installation found there"
        exit 0
    end
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/gradle/current/bin" -maxdepth 0)
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/java/current/bin" -maxdepth 0)
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/kotlin/current/bin" -maxdepth 0)
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/maven/current/bin" -maxdepth 0)
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/groovy/current/bin" -maxdepth 0)
end

# End of file required
starship init fish | source

zoxide init fish | source
