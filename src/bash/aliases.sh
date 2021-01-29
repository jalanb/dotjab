#! /bin/cat -n


# all alan"s aliases
#   as ordered by strcmp()

# One quote might help in reading these files:
#   "If in doubt, call it Fred", Dr. Mike Scott, Dublin City University, late 80s

# This list is quite long enough, we accept no other aliases
#   Thanks anyway
#
# (Except we will hang on to '.' (which is set by whype.sh))

_keep_dot=$(alias . 2>/dev/null | sed -e "s/.*=//" -e "s/'//g")  # parses out any alias of '.'
unalias -a
[[ -n "$_keep_dot" ]] && alias .=$_keep_dot

# The wee x headings are counts
#   all the wee aliases in this wee section have only one character, oui,
#       Awwww.
#   There is an alias for every letter
#       albeit most are unused
# Search for .= from here

# x

# [0-9]* are in keys/1_0.sh
# a()
# b()
# c()
# d
# e()
# f()
# g()
# h()
# i
# j()
# k()
# l()
# m
# n
# o
# p()
# q()
# Q()
# r= script
# s
# t()
# u
# v()
# w()
# x()
# y()
# z()

alias X='set -x'
alias Z='set +x'

# xx

alias ..='cdup'
alias .c='. $CDE.sh'
alias .w='. $WHYP.sh'

alias p-="echo $OLDPWD"

alias r.="rm -rvf *"

alias sr="sudo rm -vrf "

alias z.="zm \*"

# xxx

alias bim=vim
alias cim=vim

alias doc="cde ~/Documents"

alias gti=git

alias jab=j
alias jlf="sst jlfieblu jlf.ie"


alias out="to_release"

alias sle="whyp_source ~/jab/local/environ.sh optional"
alias spe=". ~/jab/environ.d/python.sh"

alias tra="try ~/alans_tests"

# xxxx

alias ....='cduppp'

alias comp=". ~/jab/environ.d/company.sh"

alias popp=pisd

# xxxxx

alias .....='cdupppp'

alias mkenv=mkvirtualenv

alias print=printf

alias whihc=which

# xxxxxx

alias ......='cduppppp'

# xxxxxxx

alias .......='cdupppppp'
alias service="sudo /sbin/service "

# xxxxxxxx

# xxxxxxxx

alias stopwatch="killall -9 watch"

alias update_hosts="sudo python ~/jab/src/python/update_hosts.py"

