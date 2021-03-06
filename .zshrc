# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
GIT_STUFF=$HOME/.darkit_git_stuff

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# gentoo
# ys
# dst
# duellj
# re5et
# tjkirch
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras git_remote_branch debian encode64 screen svn urltools cp)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# -------------------------------------------------------------------
# Keymap settings
# -------------------------------------------------------------------
# bindkey
bindkey -e
bindkey "\e[3~" delete-char
# Home- und End-Keys.
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------

alias ga='git add -A'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'

# leverage an alias from the ~/.gitconfig
alias gh='git hist'
alias glg1='git lg1'
alias glg2='git lg2'
alias glg='git lg'

# -------------------------------------------------------------------
# Capistrano aliases
# -------------------------------------------------------------------

alias capd='cap deploy'

# -------------------------------------------------------------------
# OTHER aliases
# -------------------------------------------------------------------

alias cl='clear'
alias tulpen='netstat -tulpen'
alias ls='ls -AF --group-directories-first --time-style=+"%Y-%m-%d %H:%M" --color=auto'

alias urldecode='python2 -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python2 -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias ls='ls -AF --group-directories-first --time-style=+"%Y-%m-%d %H:%M" --color=auto'

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------

function myip() {
        ip addr | egrep '(inet[6]{,1}|^[0-9]+\:)' | sed 's/inet[6]* //' | sed -r 's/^[0-9]+\:(.*?):.*/#\1/i'
}

# Load .zshrc.local file
if [[ -a ~/.zshrc.local ]]; then
        source ~/.zshrc.local
fi

# Update Git stuff
if [ "$DIT_ZSH_UPDATE" != "no" ]; then
	OLDPWD=$(pwd)
	cd "${GIT_STUFF}/zsh_config"
	echo "-> Checking for console updates"
	git pull --recurse-submodules > /dev/null
	cd ${OLDPWD}
fi

