# Set up the prompt
	export TERM="xterm-256color"
	autoload -Uz promptinit
	promptinit
	prompt adam1
	source $HOME/Software/powerlevel10k/powerlevel10k.zsh-theme
	emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'
	setopt histignorealldups sharehistory
	setopt interactivecomments

# Use emacs keybindings even if our EDITOR is set to vi
	bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
	HISTSIZE=1000
	SAVEHIST=1000
	HISTFILE=~/.zsh_history

# Use modern completion system
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

# Plugins
	source ~/.dotfiles/zsh/aliases.sh
	source ~/.dotfiles/zsh/zsh_addons/virtualenv.plugin.zsh

# Keybindings
	# emacs meta-words
	bindkey "^[[1;f" forward-word
	bindkey "^[[1;b" backward-word

# Powerline customization
	POWERLEVEL9K_PROMPT_ON_NEWLINE=true
	POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

	# status
	POWERLEVEL9K_STATUS_VERBOSE=false

	# right prompt
	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status vcs time)

	# left prompt
	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir)

# Software
	# go
	export GOPATH=$HOME/Software/go
	export PATH="$PATH:$HOME/Software/go/bin/"
	export PATH="$PATH:/usr/local/go/bin/"

	# flutter
	export PATH="$PATH:/usr/lib/dart/bin"
	export PATH="$PATH:$HOME/Software/flutter/bin"

	# not global but global npm packages
	NPM_PACKAGES="${HOME}/Software/npm_packages"
	export PATH="$PATH:${NPM_PACKAGES}/bin"
		# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
		unset MANPATH # delete if you already modified MANPATH elsewhere in your config
		export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# PATH variables
	if [[ $(uname) == "Darwin" ]]; then
		# JDK 8 java home
    	export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
	else
		# JDK 8 java home
		export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
		# terminal visible snap packages
		export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop/"
		export PATH="$PATH:/bin/snap" 
		emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'
  fi
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
	export SDKMAN_DIR="$HOME/.sdkman"
	[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
