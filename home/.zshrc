## set command prediction from history, see 'man 1 zshcontrib'
is4 && zrcautoload predict-on && \
zle -N predict-on         && \
zle -N predict-off        && \
bindkey "^X^Z" predict-on && \
bindkey "^Z" predict-off

## press ctrl-q to quote line:
mquote () {
      zle beginning-of-line
      zle forward-word
      # RBUFFER="'$RBUFFER'"
      RBUFFER=${(q)RBUFFER}
      zle end-of-line
}
zle -N mquote && bindkey '^q' mquote

bindkey '\eq' push-line-or-edit

## add `|' to output redirections in the history
setopt histallowclobber

## don't warn me about bg processes when exiting
setopt nocheckjobs

## Allow comments even in interactive shells
setopt interactivecomments


## changed completer settings
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' completer _expand_alias _complete _approximate
zstyle ':completion:*' special-dirs true

## global aliases (for those who like them) ##

alias -g '...'='../..'
alias -g '....'='../../..'
alias -g BG='& exit'
alias -g C='|wc -l'
alias -g G='|grep'
alias -g H='|head'
alias -g Hl=' --help |& less -r'
alias -g K='|keep'
alias -g L='|less'
alias -g LL='|& less -r'
alias -g M='|most'
alias -g N='&>/dev/null'
alias -g R='| tr A-z N-za-m'
alias -g SL='| sort | less'
alias -g S='| sort'
alias -g T='|tail'
alias -g V='| vim -'

## Use a default width of 80 for manpages for more convenient reading
export MANWIDTH=${MANWIDTH:-80}

## Set a search path for the cd builtin
#cdpath=(.. ~)

## variation of our manzsh() function; pick you poison:
manzsh()  { /usr/bin/man zshall |  most +/"$1" ; }

## Handy functions for use with the (e::) globbing qualifier (like nt)
contains() { grep -q "$*" $REPLY }
sameas() { diff -q "$*" $REPLY &>/dev/null }
ot () { [[ $REPLY -ot ${~1} ]] }

## Download a file and display it locally
uopen() {
    emulate -L zsh
    if ! [[ -n "$1" ]] ; then
        print "Usage: uopen \$URL/\$file">&2
        return 1
    else
        FILE=$1
        MIME=$(curl --head $FILE | \
               grep Content-Type | \
               cut -d ' ' -f 2 | \
               cut -d\; -f 1)
        MIME=${MIME%$'\r'}
        curl $FILE | see ${MIME}:-
    fi
}

## Memory overview
memusage() {
    ps aux | awk '{if (NR > 1) print $5;
                   if (NR > 2) print "+"}
                   END { print "p" }' | dc
}

## END OF FILE #################################################################
