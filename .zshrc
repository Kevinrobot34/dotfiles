fpath=(~/.zsh $fpath)

## 色を使用出来るようにする
autoload -Uz colors
colors

################################################################################
# completion
################################################################################

# for zsh-completions ( https://github.com/zsh-users/zsh-completions ) insalled with brew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# manual completion settings
# - docker & docker-compose
#   - `ln -s /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion ~/.zsh/completion/_docker`
#   - `ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion ~/.zsh/completion/_docker-compose`
# - poetry
#   - `poetry completions zsh > ~/.zsh/completion/_poetry`
#   - https://python-poetry.org/docs/#enable-tab-completion-for-bash-fish-or-zsh
if [ -e ~/.zsh/completion ]; then
  fpath=(~/.zsh/completion $fpath)
  autoload -Uz compinit && compinit -i
fi

### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
### 補完候補に色を付ける。
#zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-colors "${LS_COLORS}"
## タブ補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


#ヒストリの一覧を読みやすい形に変更
#HISTTIMEFORMAT='[%Y/%M/%D %H:%M:%S] '
#setopt EXTENDED_HISTORY
# プロセスを横断してヒストリを共有
#setopt inc_append_hisotry
# ヒストリの共有の有効化
#setopt share_history
# 直前と同じコマンドをヒストリに追加しない
#setopt hist_ignore_dups
# ヒストリに追加されるコマンドが古いものと同じなら古いものを削除
#setopt hist_ignore_all_dups

################################################################################
# **env settings
################################################################################

# settings for pyenv
if [ "$(uname -m)" = "arm64" ]; then
  export PYENV_ROOT="$HOME/.pyenv_arm64"
else
  export PYENV_ROOT="$HOME/.pyenv"
fi
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# settings for pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1 # do NOT display venv-name in prompt


# settings for nodenv
eval "$(nodenv init -)"


# direnv 
# https://github.com/direnv/direnv
eval "$(direnv hook zsh)"

################################################################################
# poetry
################################################################################
# https://python-poetry.org/docs/#installation
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

################################################################################
# PROMPT
################################################################################
# prompt : git
setopt PROMPT_SUBST
if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
  source ${HOME}/.zsh/git-prompt.sh
fi
export GIT_PS1_DESCRIBE_STYLE=default
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

# prompt : pyenv
precmd () {
  PYTHON_VERSION_STRING="py:"$(pyenv version-name)
  #PYTHON_VIRTUAL_ENV_STRING=""
  #if [ -n "$VIRTUAL_ENV" ]; then
  #  PYTHON_VIRTUAL_ENV_STRING=":`basename \"$VIRTUAL_ENV\"`"
  #fi
  ARCH_NAME=$(uname -m)
}

# settings for PROMPT
PROMPT='
[%B%F{red}%n@%m%f%b($ARCH_NAME):%F{yellow}%~%f] %F{cyan}$(__git_ps1 "(%s)")%f %F{green}($PYTHON_VERSION_STRING)%f
%# '
# RPROMPT='%F{cyan}($PYTHON_VERSION_STRING)%f'
RPROMPT='%{$fg[green]%} %D{%Y/%m/%d} %*%{$reset_color%}'

################################################################################
# Docker
################################################################################
export DOCKER_BUILDKIT=1

################################################################################
# google cloud sdk
################################################################################
# https://cloud.google.com/sdk/docs/install?hl=ja#mac
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

################################################################################
# alias
################################################################################
alias ls='ls -G' # ls with colored text
alias ll='ls -G -l'
alias arch-arm="exec arch -arch arm64e /bin/zsh --login"
alias arch-x64="exec arch -arch x86_64 /bin/zsh --login"

################################################################################
# Snowflake
################################################################################
# added by Snowflake SnowSQL installer v1.2: https://docs.snowflake.com/ja/user-guide/snowsql-install-config.html#installing-snowsql-on-macos-using-homebrew-cask
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql

################################################################################
# others
################################################################################
ZSHHOME="${HOME}/.zsh"
if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi