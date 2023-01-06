# General prompt configuration
        # shell options
        export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop/"
        setopt histignorealldups sharehistory interactivecomments
        HISTSIZE=2000
        SAVEHIST=2000
        HISTFILE=$HOME/.zsh_history
	DOOMDIR=$DOTFILES/emacs/

        # completion
        autoload -Uz compinit
        compinit
        zstyle ':completion:*' auto-description 'specify: %d'
        zstyle ':completion:*' completer _expand _complete _correct _approximate
        zstyle ':completion:*' format 'Completing %d'
        zstyle ':completion:*' group-name ''
        zstyle ':completion:*' menu select=2
        eval "$(dircolors -b)"
        zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
        zstyle ':completion:*' list-colors ''
        zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
        zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
        zstyle ':completion:*' menu select=long
        zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
        zstyle ':completion:*' use-compctl false
        zstyle ':completion:*' verbose true
        zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
        zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Theme configuration
        export TERM="xterm-256color"

        # prompt layout
        POWERLEVEL9K_STATUS_VERBOSE=false
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status vcs time)
        POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir_joined)
        POWERLEVEL9K_PROMPT_ON_NEWLINE=true
        POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
        POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="> "

        # location
        POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
        POWERLEVEL9K_DIR_MAX_LENGTH=
        POWERLEVEL9K_SHORTEN_DELIMITER=

# Key bindings
        bindkey -e # force emacs bindings
        bindkey "^[[1;f" forward-word
        bindkey "^[[1;3C" forward-word
        bindkey "^[[1;b" backward-word
        bindkey "^[[1;3D" backward-word

# ZSH specific/ addons
        source $DOTFILES/zsh/aliases.sh
	source $DOTFILES/zsh/snap_krunner.sh
        export PATH="$PATH:$DOTFILES/scripts"

# Software
        export PATH="$PATH:$HOME/Software/bin/"
        export PATH="$PATH:$HOME/.emacs.d/bin/"
	export PATH="$PATH:$HOME/.local/bin/"
	export PATH="$PATH:$HOME/.local/share/coursier/bin/"
	export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin/"
