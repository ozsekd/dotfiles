# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
#alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

alias ownall='sudo chown -cR ausek:users'
alias own='sudo chown -c ausek:users'
alias l='ls -Alh --color=always'
alias c='clear'

alias urlclean="awk -F/ '!seen[$3]++'"
alias lsp="stat -c '%U:%G %a %A %n'"
alias pxg='gksudo pacmanxg'

salias rmd='rm -vfr'
salias rm='rm -vf'
salias defrag='find / -xdev -type f -print -exec btrfs filesystem defrag '{}' \;'

salias shodan='python2 ~/shodan_ips.py "jboss" country:US country:AU country:GB country:CA country:NZ'

alias parse-ips='grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b"'
salias n1='nmap -O --osscan-limit -sS -n -p 80,8080,443,3389 -T4 -vv --min-hostgroup 100 --min-parallelism 100 --open'
salias n2='nmap -sS -n -p 27017 -T4 -vv --min-hostgroup 100 --min-parallelism 100 --open'
