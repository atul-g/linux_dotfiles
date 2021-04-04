# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/atulu/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions docker docker-compose)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/atulu/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/atulu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/atulu/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/atulu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# snap not showing up error:
# emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'


# PURE PROMPT INSTALLATION:
fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit

zmodload zsh/nearcolor
zstyle :prompt:pure:virtualenv color '#00acee'
zstyle :prompt:pure:path color yellow

prompt pure

export PATH="$HOME/.radicle/bin:$PATH"

cheat() {
    curl cheat.sh/$1
}


# For go and syzkaller
export PATH=~/go/bin:$PATH
export PATH=~/go/src/github.com/google/syzkaller/bin:~/go/src/github.com/google/syzkaller/bin/linux_amd64/:$PATH


# To make tmux to render proper grey color for auto-suggestions
export TERM=xterm-256color

# to make sure certain lines in htop tree, zsh prompt etc showed
# properly in tmux
alias tmux='tmux -u'


# setting virtme stuff into the PATH
export PATH=~/Documents/virtme-linux/virtme/:~/Documents/virtme-linux/virtme/bin/:$PATH



# Function to use 0x0.st pastebin service in easy way
0x0() {
	which xclip > /dev/null
	if [ $? -ne 0 ]
	then
		echo "This function needs xclip. Install it please."
		return 1
	fi

	if [ "$1" = "c" ]
	then
		xclip -o > /tmp/0x0-pastebin.temp
		echo "making paste from clipboard...\n"
		if [ "$2" = "s" ]
		then
			echo "######## Contents of paste #########"
			cat /tmp/0x0-pastebin.temp
			echo "\n########### End of paste ###########\n"
		fi
		curl -F 'file=@/tmp/0x0-pastebin.temp' https://0x0.st

	elif [ "$1" = "f" ]
	then
		echo "making paste from file...\n"
		# if show argument was also passed
		if [ "$2" = "s" ]
		then
			echo "######## Contents of paste #########"
			cat "$3"
			echo "\n########### End of paste ###########\n"
			curl -F "file=@"${3}"" https://0x0.st

		elif [ "$2" != "" ]
		then
			curl -F "file=@"${2}"" https://0x0.st
		else
			echo "No file passed...Aborting."
			return 2 # not really necessay, but it helps
				 # for setting $? as non zero
		fi
	else
		echo "No arguments passed..."
		echo "Usage: 0x0 {c|f} [s] [/path/to/file]"
		echo "c - make paste from system clipboard"
		echo "f - make paste from specified file"
		echo "s - show the contents of paste created"
		return 2
	fi
}
