ZSH_THEME="spaceship"

# plugins=(
  # git
  # dirpersist
# )

# Use vim/nvim as editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=false
SPACESHIP_HOST_SHOW=false
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_GIT_STATUS_COLOR=green
SPACESHIP_GIT_STATUS_SHOW=false

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.dotfiles/aliases.zsh
source ~/.bash_profile
