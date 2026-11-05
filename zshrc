# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="Lukerandall"

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

# Change auto-update behavior: disable startup check; update manually with omz update
zstyle ':omz:update' mode disabled

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
plugins=(git)
# auto-completion
# if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
# Skip compaudit directory security scan on startup
ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh

# Bytecode compile zcompdump in background if newer than the compiled cache
if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
  zcompile "$ZSH_COMPDUMP" &!
fi



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



# VS Code
alias code='open -b com.microsoft.VSCode "$@"' # Prevents duplicate VS Codes in Dock

# AWS
export AWS_ACCESS_KEY_ID=aws_access_key_id_placeholder # Disabled for SSO
export AWS_SECRET_ACCESS_KEY=aws_secret_access_key_placeholder # Disabled for SSO
export AWS_DEFAULT_REGION=us-east-1
export projects=~/Documents/Projects
# export GITHUB_TOKEN=github_token_placeholder
export TWILIO_ACCOUNT_SID=abc123
export TWILIO_AUTH_TOKEN=xyz123
export SENDER_NUMBER="+1234567890"
export TF_VAR_twilio_account_sid=$TWILIO_ACCOUNT_SID
export TF_VAR_twilio_auth_token=$TWILIO_AUTH_TOKEN
export TF_VAR_sender_number=$SENDER_NUMBER
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
export GEMINI_API_KEY=gemini_api_key_placeholder
export RAPIDAPI_KEY=rapidapi_key_placeholder
export ANDROID_HOME="$HOME/Library/Android/sdk"                                                                                                                 
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin"  
export OLLAMA_HOST=https://ollama_host_placeholder
export OLLAMA_API_BASE=$OLLAMA_HOST

# PATH
typeset -gU path PATH  # drop duplicate entries, keeping the first (highest-priority) one
export PATH="/opt/homebrew/bin:$PATH"

alias aider='aider --model ollama/qwen2.5-coder:7b --openai-api-base $OLLAMA_HOST --read specs/architecture.md --map-tokens 1024'
# Docker Aliases
alias dockerrmvblank='docker rmi $(docker images | grep "^<none>" | awk "{print $3}") --force'

# Git Aliases
alias co='git checkout'
alias cob=gitcob
alias refresh='source ~/.zshrc'
alias pushall=gitpush
alias pa=gitpush
alias push='git push'
alias pull='git pull'
alias cm='git commit -m'
alias status='git status'
alias pip='pip3'
alias python='python3'
alias claude='caveman claude'
# alias agy='caveman run -- agy'
alias sso-login=ssoLogin

# For the system Java wrappers to find this JDK, symlink it with
#  sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
# echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc
# sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
# Good with Jenv now I think

# Python Alias
# alias python=python3

# Lazy load NVM
export NVM_DIR="$HOME/.nvm"
load_nvm() {
  unset -f nvm node npm npx yarn pnpm corepack load_nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
for cmd in nvm node npm npx yarn pnpm corepack; do
  eval "$cmd() { load_nvm; \$0 \"\$@\"; }"
done

function set_twilio_vars {
	export SENDER_NUMBER=sender_number_placeholder
	export TWILIO_ACCOUNT_SID=twilio_account_sid_placeholder
	export TWILIO_AUTH_TOKEN=twilio_auth_token_placeholder
	export TWILIO_VERIFY_SERVICE_SID=twilio_verify_service_sid_placeholder
}

function gitcob() {
  if [[ -z "$1" ]]; then
    echo "Error: Branch name required. Usage: gitcob <branch-name>"
    return 1
  fi
  git checkout -b "$1" && git push -u origin "$1"
}

function branches() {
	git branch -a
}

function gitstatus() {
	git status
}

gitpush() {
  local msg="${*:-wip}" # Defaults to "wip" if no message provided
  git add -A
  git commit -m "$msg" && git push
}
function git_delete_branch() {
  if [[ -z "$1" ]]; then
    echo "Error: Branch name required. Usage: git_delete_branch <branch-name>"
    return 1
  fi
  git branch -D "$1"
  git push origin --delete "$1"
}

# Remove worktrees (and their local branches) whose work is merged into main.
# Merged = HEAD already in origin/main, or GitHub shows a merged PR for the branch
# (catches squash merges). Worktrees with uncommitted changes or commits beyond
# the merged PR are asked about individually; everything else is one confirmation.
function cleanworktrees() {
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "Error: Not a git repository."; return 1; }

    local main_branch=main
    git show-ref --verify --quiet refs/heads/main || main_branch=master

    echo "Fetching origin..."
    git fetch --prune --quiet origin || return 1

    # branch -> PR head sha, for merged PRs
    local -A merged_prs
    if command -v gh >/dev/null 2>&1; then
        local name oid
        while IFS=$'\t' read -r name oid; do
            [[ -n $name ]] && merged_prs[$name]=$oid
        done < <(gh pr list --state merged --limit 1000 --json headRefName,headRefOid \
                   --jq '.[] | [.headRefName, .headRefOid] | @tsv' 2>/dev/null)
    else
        echo "(gh not found: only detecting branches merged with a merge commit)"
    fi

    local main_wt=${$(git worktree list --porcelain | head -1)#worktree }
    local here=$(git rev-parse --show-toplevel)

    local -a safe_paths safe_branches risky_paths risky_branches risky_reasons
    local wt_path head branch line reason pr_oid
    while IFS= read -r line || [[ -n $line ]]; do
        case $line in
            worktree\ *) wt_path=${line#worktree }; head=""; branch="" ;;
            HEAD\ *)     head=${line#HEAD } ;;
            branch\ *)   branch=${line#branch refs/heads/} ;;
            "")
                [[ -z $wt_path || $wt_path == $main_wt || $wt_path == $here ]] && { wt_path=""; continue; }
                [[ $branch == $main_branch ]] && { wt_path=""; continue; }
                [[ -d $wt_path ]] || { wt_path=""; continue; }   # missing folders get pruned below

                reason=""
                if git merge-base --is-ancestor "$head" "origin/$main_branch" 2>/dev/null; then
                    :
                elif [[ -n $branch && -n ${merged_prs[$branch]} ]]; then
                    pr_oid=${merged_prs[$branch]}
                    if [[ $head != $pr_oid ]] && ! git merge-base --is-ancestor "$head" "$pr_oid" 2>/dev/null; then
                        reason="has commits not in the merged PR"
                    fi
                else
                    wt_path=""; continue                         # not merged: leave alone
                fi
                if [[ -n $(git -C "$wt_path" status --porcelain 2>/dev/null) ]]; then
                    reason="${reason:+$reason, }has uncommitted changes"
                fi

                if [[ -z $reason ]]; then
                    safe_paths+=("$wt_path"); safe_branches+=("$branch")
                else
                    risky_paths+=("$wt_path"); risky_branches+=("$branch"); risky_reasons+=("$reason")
                fi
                wt_path=""
                ;;
        esac
    done < <(git worktree list --porcelain; echo)

    _cw_remove() {  # $1 path, $2 branch (may be empty)
        local parent=${1:h}
        if git worktree remove --force "$1"; then
            [[ -n $2 ]] && git branch -D "$2" >/dev/null 2>&1
            echo "   removed $1${2:+ ($2)}"
            # drop now-empty holder dirs like ~/Projects/mmf-wt
            [[ $parent != $main_wt* ]] && rmdir "$parent" 2>/dev/null && echo "   removed empty $parent"
        else
            echo "   [failed] $1"
        fi
    }

    local i reply
    if (( ${#safe_paths} + ${#risky_paths} )); then
        echo "\nMerged worktrees to remove:"
        for i in {1..${#safe_paths}}; do
            (( ${#safe_paths} )) || break
            echo "  ${safe_branches[$i]:-(detached)}  ${safe_paths[$i]}"
        done
        for i in {1..${#risky_paths}}; do
            (( ${#risky_paths} )) || break
            echo "  ${risky_branches[$i]:-(detached)}  ${risky_paths[$i]}  [${risky_reasons[$i]}]"
        done
        read "reply?Double-check no Claude sessions are using these worktrees. Remove all? (y/N): "
        if [[ $reply =~ ^[Yy]$ ]]; then
            for i in {1..${#safe_paths}}; do
                (( ${#safe_paths} )) || break
                _cw_remove "${safe_paths[$i]}" "${safe_branches[$i]}"
            done
            for i in {1..${#risky_paths}}; do
                (( ${#risky_paths} )) || break
                _cw_remove "${risky_paths[$i]}" "${risky_branches[$i]}"
            done
        fi
    fi

    unfunction _cw_remove
    git worktree prune
    (( ${#safe_paths} + ${#risky_paths} )) || echo "No merged worktrees found."
    echo "Worktree cleanup complete."
}

function ssoLogin() {                                                                                                                                           
    export AWS_PROFILE=mmf                                                                                                                                      
    aws sso login --profile mmf                                                                                                                                 
    # aws sts get-caller-identity                                                                                                                                 
}  


function cleanlocalbranches() {
    git fetch -p
    local branches
    branches=$(git branch -vv | grep ': gone]' | grep -v '^+' | awk '{print ($1 == "*") ? $2 : $1}')
    if [[ -n "$branches" ]]; then
        echo "$branches" | xargs git branch -D
    else
        echo "No stale branches to delete."
    fi
}

function gitfetch() {
	echo "executing: git fetch -p origin"
	git fetch -p origin
}

export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"


# Added by Antigravity CLI installer
export PATH="/Users/robertkump/.local/bin:$PATH"
# Lazy load jEnv (shims in PATH keep java/javac instant)
export PATH="$HOME/.jenv/shims:$HOME/.jenv/bin:$PATH"
jenv() {
  unset -f jenv
  eval "$(command jenv init -)"
  jenv "$@"
}
alias webstorm='open -b com.jetbrains.WebStorm'

# gh stack: checkout a stack by PR number, rebase onto base, then (after fixing conflicts) push
# Usage: ghsr <pr-number>   -> checkout + rebase; resolve conflicts, commit, then run `ghsp`
ghsr() {
  if [[ -z "$1" ]]; then
    echo "usage: ghsr <pr-number>" >&2
    return 1
  fi
  gh stack checkout "$1" && gh stack rebase
}
alias ghsp='gh stack push'

# Start GitHub Actions self-hosted runner in the background if not already running
_gh_runner_dir="$HOME/Projects/actions-runner"
if [[ -x "$_gh_runner_dir/run.sh" ]] && ! pgrep -f "$_gh_runner_dir/run.sh" >/dev/null; then
  nohup "$_gh_runner_dir/run.sh" >> "$_gh_runner_dir/_diag/nohup.out" 2>&1 &!
fi
unset _gh_runner_dir

