# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	exec startx
fi

export EDITOR=nvim

export PATH="$HOME/go/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Themes (See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
# ZSH_THEME="robbyrussell"
#ZSH_THEME="passion"
# ZSH_THEME="mrtazz"
source "$ZSH/themes/cool.zsh"

# Pure prompt settings
#fpath+=($ZSH/themes/pure)
#source "$ZSH/themes/pure/pure.zsh"
#source "$ZSH/themes/pure/async.zsh"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "mrtazz" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 15

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM="$ZSH/custom"

####################################################################
#                           Plugins                                #
####################################################################
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Environment variables
source $ZSH_CUSTOM/.env.zsh

# export ARCHFLAGS="-arch x86_64"

####################################################################
#                           Aliases                                #
####################################################################
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source $ZSH_CUSTOM/aliases.zsh

####################################################################
#                          Keybinds                                #
####################################################################
# Set personal keybinds
source $ZSH_CUSTOM/keybinds.zsh

# DELETE THIS LINE WHEN DONE TESTING
source "$HOME/Tools/SSHTools/.env.sh"
