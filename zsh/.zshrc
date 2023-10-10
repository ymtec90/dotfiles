# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

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
plugins=(git
	zsh-autosuggestions
	zsh-syntax-highlighting
    k
    z)

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

export PATH="$HOME/.local/bin/:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Virtualenv list
lvenv() {
    venv_folder="$HOME/.virtualenvs"

    if [ -d "$venv_folder" ]; then
        ls $venv_folder
    else
        echo "There is no environment to list. Please create a environment to proceed."
    fi
}

# Virtualenv creation function
cvenv() {
    venv_folder="$HOME/.virtualenvs/"
    venv_name="$1"

    if [ -d "$venv_folder" ]; then
        mkdir -p "$venv_folder/$venv_name"
        python -m venv "$venv_folder/$venv_name"
        echo "Virtual enviroment created successfully."
    else
        mkdir -p "$venv_folder"
        mkdir -p "$venv_folder/$venv_name"
        python -m venv "$venv_folder/$venv_name"
        echo "Virtual enviroment created successfully."
    fi
}

# Virtualenv activation function
avenv() {
    venv_folder="$HOME/.virtualenvs/"

    echo "avaliable virtual enviroments."
    ls "$venv_folder"

    echo "insert the name of the virtual enviroment you would like to activate."
    read venv_name

    venv_path="$venv_folder$venv_name"

    if [ -d "$venv_path" ]; then
        source "$venv_path/bin/activate"
    else
        echo "virtual enviroment not found."
    fi
}

# Virtualenv delete
dvenv() {
    venv_folder="$HOME/.virtualenvs/"

    echo "avaliable virtual environments:"
    ls "$venv_folder"

    echo "insert the name of the virtual environment you would like to delete."
    read venv_name

    venv_path="$venv_folder$venv_name"

    if [ -d "$venv_path" ]; then
        rm -rf "$venv_path"
    else
        echo "virtual enviroment not found."
    fi
}

# Flask server initiation function
# Navigate to the source folder of the server and the user the fuction followed by the
# Python script file without the .py to start the server
flask_init() {
    flask_script="$1"
    export FLASK_APP="$flask_script"
    export FLASK_ENV=development
    export FLASK_DEBUG=1
    flask run --host=0.0.0.0
}

# Video convert function for HTML5 formats support
# based on https://gist.github.com/yellowled/1439610
video_conv() {
    IN=$1
    OUT=$(echo $1 | sed 's/^\(.*\)\.[a-zA-Z0-9]*$/\1/')
    # webm
    ffmpeg -i $IN -f webm -vcodec libvpx -acodec libvorbis -ab 128000 -crf 22 -s 640x360 $OUT.webm

    # mp4
    ffmpeg -i $IN -acodec aac -strict experimental -ac 2 -ab 128k -vcodec libx264 -vpre slow -f mp4 -crf 22 -s 640x360 $OUT.mp4

    # ogg (if you want to support older Firefox)
    # ffmpeg2theora $IN -o $OUT.ogv -x 640 -y 360 --videoquality 5 --audioquality 0  --frontend
}

# function to use fzf to selected a specific nvim distro
function nvims() {
  items=("defaut" "AstroNvim" "LazyVim" "NvChad")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# Aliases for xrandr command
alias vgavid="xrandr --output VGA-1 --auto --right-of LVDS-1"
alias hdvid="xrandr --output HDMI-1 --auto --right-of LVDS-1"

# Another aliases
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias tmxrc="vim ~/.tmux.conf"
alias vi="vim"
alias reload="exec zsh"
alias :q="exit"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias tw-init="npm install -D tailwindcss && npx tailwindcss init"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
