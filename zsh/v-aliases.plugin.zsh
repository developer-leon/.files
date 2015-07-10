# General
alias cd..='cd ..'
alias h='cd ~'
alias ..="cd .."
alias ...="cd ../.."
alias _="sudo"
alias o='open .'

alias lines="find . -name '*.php' | xargs wc -l"

alias hosts='sudo slap /etc/hosts'

alias sl='sudo slap'
alias ss='sudo subl'
alias sat='sudo atom'
alias sps='sudo pstorm'

# Brew
alias b='brew'
alias bs='brew search'
alias bi='brew install'
alias bu='brew uninstall'
alias bl='brew list'
alias bupd='brew update' # Update brew
alias bupg='brew upgrade' # Update Formulae
alias bdr='brew doctor'

# Laravel
alias art='php artisan'
alias artisan='php artisan'

# Composer
alias c='composer'
alias cda='composer dumpautoload -o'

# Homestead
alias vm='cd ~/.homestead'
alias vmup='homestead up'
alias vms='homestead status'
alias vmssh='homestead ssh'

# Magento
alias flush='./n98-magerun.phar cache:flush'

# The Fuck
alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'

# Git
alias git='hub'
alias gs='git status'

alias ga='git add'                       ### $ ga my_file.php
alias gaa='git add -a'
alias gaA='git add -A'                   # this command also tracks renamed files

alias gc='git commit -m'                 ### $ gc "first commit"
alias gca='git commit -am'               ### $ gca "a bunch of changes"
alias gcA='git add -A; git commit -m'    ### $ gcA "My_Class.php renamed"

alias gpt="git push --tags"
alias gsh='git show'                     ### $ gsw 1.0

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -D'
alias gm='git checkout master'
alias gco='git checkout'                 ### $ gco my_branch
alias gcof='git checkout --'             ### $ gcof path/to/my_file.php
alias gcob='git checkout -b'             ### $ gcob my_new_branch

alias gp='git pull'
alias gpr='git pull --rebase'
alias gf='git fetch'
alias gr='git rebase'
alias gri='git rebase -i'

alias gpp='git push'
alias gppt='git push --tags'
alias gppu='git push -u origin'

alias grh='git reset --hard HEAD~1'
alias grh~='git reset --hard HEAD~'
alias grs='git reset --soft HEAD~1'
alias grs~='git reset --soft HEAD~'

alias gdf='git diff'

alias gcp='git cherry-pick'
alias gcpx='git cherry-pick -x'

# Git log find by commit message
function glf() { git log --all --grep="$1"; }

# git tag -a
function gt() { git tag -a $1 -m $2; }       # gt 1.0 "Graduation!"

alias gl="git log --pretty='format:%Cgreen%h%Creset %an - %s' --graph"
alias gll="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias glll="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
