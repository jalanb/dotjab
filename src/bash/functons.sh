#! /bin/cat


# set -e
. ~/bash/types.sh

typed show_green || . ~/bash/crayons.sh
typed pong || . ~/bash/pong.sh
typed pii || . ~/bash/python.sh

# Called functons.sh because "functions" is ... something else

# sorted by strcmp of function name, punctuation before letters

# _x

,. () {
    [[ -f .cd ]] && . .cd
}

,, () {
    cde . "$@"
}

# xx

3d () {
    3l -d "$@"
}

3l () {
    local _num=
    [[ $1 =~ ^[0-9]+$ ]] && _num=$1
    [[ $_num ]] && shift || _num=3
    Tree -L $_num  "$@"
}

3y () {
    local _dir=
    [[ -f "$1" ]] && _dir=$(dirname "$1")
    [[ -d "$1" ]] && _dir="$1"
    if [[ -f "$1" ]]; then
        dir=$(dirnames "$1")
        shift
    elif [[ -d "$1" ]]; then
        dir=$1
        shift
    else
        dir=
    fi
    3l -P "*.py" $dir "$@"  --prune | sed -e 's/^│/ /' -e 's/\\s/_/g' -e 's/[│├└]/ /g' -e 's:──:/:'
}

IP () {
    local _break=yes
    if [[ $1 == all ]]; then
        _break=no
    fi
    for number in 10 172 193 192 100
    do
        if ~/jab/bin/mifconfig $number; then
            if [[ $_break == yes ]]; then
                break
            fi
        fi
    done
}


_free_line_here () {
    :
}


ma () {
    local _storage=/tmp/fred.sh;
    if [[ -z "$@" ]]; then
        python -c "print 'memo -a\"$*\"'" > $_storage;
        bash $_storage;
        cat $_storage;
        rr $_storage;
    fi
}

ml () {
    memo -l 9
}

pg () {
    ps -ef | grep -v grep | grep "$@"
}

pt () {
    ptpython "$@"
}

ra () {
    ranger "$@"
}

rg () {
    [[ "$@" ]] && c "$@"
    ranger
}

ru () {
    # do da root root route, do da ru !
    (
        PATH="/sbin:/usr/sbin:/usr/local/sbin:$PATH"
        export PATH
        [[ "$@" ]] && sudo "$@" || sudo_console
    )
}

tm () {
    if [[ -z $1 ]]; then SESSION=$(short_hostname)
    else
        SESSION=$1
        shift
    fi
    ! tmux attach-session -t $SESSION "$@" && tmux new-session -s $SESSION "$@"
}

tf () {
    [[ $? -eq 0 ]] && echo "true" || echo "false"
}

tt () {
    if echo $1 | grep -q "gz$"; then
        contents=tz
        extract=xz
    else
        contents=t
        extract=x
    fi
    tar ${extract}f $1
    cd $(tar ${contents}f $1 | head -n 1)
    ranger
}

va () {
    _edit_source $(aliases) "$@"
}

ve () {
    _edit_source ~/jab/environ.d/jab.sh "$@"
}

vf () {
    _edit_source $(functons) "$@"
}

vp () {
    _edit_source ~/bash/prompt.sh +/^_colour_prompt
}

# xxx

add () {
    echo $(($1 + $2))
}

ask () {
    local _answer=
    read -e -n1 -p "$1 " _answer
    echo $_answer
}

clf () {
    cat ~/jab/local/functons.sh
}

dir () {
    local _where=.
    [[ -n "$@" ]] && _where="$@"
    say $(short_dir $_where)
}

calf () {
    cat ~/jab/local/functons.sh
}

envv () {
    env | grep VIRTUAL_ENV= | grep '=.*'
}

fdv () {
    vim -p $(fd "$@")
}

fgg () {
    fgv *.py "$@"
}

fgp () {
    fgv *.py "$@"
}

fgt () {
    fgv *.test *.tests "$@"
}

ftt () {
    fgv *.test *.tests "$@"
}

ght () {
    gh "$@" | tel
}

ghv () {
    local __doc__="edit stuff from history"
    history | grep -v "\<\(history\|gh\)\>" | sed -e "s/^ *[0-9]\+ *//" -e "s/\([JFMASOND][a-z][a-z].[0-9][0-9] - [0-9:]\+\)\( \+\)/\1=/" | vim - +/"$@"
}

gre () {
    [[ -z $* ]] && echo "gre what?" >&2 || $(which grep) -h --color=never "$@"
}

gv. () {
    PYTHONPATH=$(realpath .) gv .
}

gvd () {
    EDITOR=gvim vd "$@"
}

hd1 () {
    head -n 1 "$@"
}

hed () {
    SCREEN=$(screen_height)
    SCREEN=${LINES:-$(screen_height)}
    HALF_SCREEN=`expr $SCREEN / 2`
    HEADLINES=${HEADLINES:-$HALF_SCREEN}
    head -n ${1:-$HEADLINES} "$@"
}

hub () {
    local _directory=~/hub
    local _remote=
    [[ $( clipout ) =~ http.*git ]] && _remote=$( clipout )
    [[ $1 =~ http.*git ]] && _remote="$1" && shift
    local _destination=
    if [[ -n "$@" ]]; then
        if cde_ok ~/hub "$@"; then
            _directory=$(cde_first ~/hub "$@")
        fi
    fi
    if [[ $_remote =~ http ]]; then
        [[ -d $_directory ]] && cd $_directory
        _directory=$(clone -n $_remote)
    fi
    [[ -d $_directory ]] && cde $_directory
    [[ $(rlf $_directory) == $(rlf ~/hub) ]] && return 0
    cde $_directory
}

inj () {
    ind ~/jab "$@"
}

jjb () {
    kk ~/bash "$@"
}

jjy () {
    kk ~/jab/src/python "$@"
}

gsij () {
    gsi ~/jab
}

l1d () {
    ld -1 "$@"
}

lda () {
    ls -1da "$@"
}

lff () {
    ls fred*
}

lka () {
    l -a "$@"
}

lkk () {
    l -a "$@"
}

lkl () {
    lkra "$@"
}

lkq () {
    local _sought=$1
    if [[ -f $_sought ]]; then
        l $_sought
        return 0
    fi
    while [[ -n $_sought ]]; do
        if l -d $_sought 2>/dev/null; then
            break
        fi
        _sought=$(dirnames $_sought)
        if [[ $_sought == / ]]; then
            break
        fi
    done
}

lkr () {
    l -lhtr "$@"
}

lib () {
    lr ~/.bashrc
}

lla () {
    ll -a "$@"
}

lly () {
    shift_dir "$@" && shift
    reset=$(shopt -p dotglob)
    shopt -s dotglob
    lr "$dir"/*.tests
    echo
    lr "$dir"/*.test
    echo
    lr "$dir"/*.py
    $reset
}

lns () {
    ln -s "$@"
}

loc () {
    locate "$@"
}

lof () {
    locate -f "$@"
}

lr1 () {
    shift_dir "$@" && shift
    l -1tr --color=always "$dir" | tel
}

lra () {
    lr -a "$@"
}

lrd () {
    lr -d "$@"
}

lrt () {
    l --color=always -lrth "$@" | tel
}

ls1 () {
    l1 "$@" | sort
}

lsh () {
    l *.sh
}


lyy () {
    reset=$(shopt -p dotglob)
    shopt -s dotglob
    l -xd $(ls -F |grep \/$)
    echo
    lx *.tests 2>/dev/null
    echo
    lx *.test 2>/dev/null
    echo
    lx *.py 2>/dev/null
    $reset
}

mkd () {
    local __doc__='make a directory' _error=0
    if [[ -d "$1" ]]; then
        [[ $# > 1 ]] || echo Directory existed "$@" >&2
        _error=1
    else
        mkdir -p "$1"
    fi
    [[ $# > 1 ]] || return $_error
    (cd "$1"
        shift
        for x in "$@"; do [[ -e "$x" ]] || touch "$x"; done
        _error=$?
    )
    return $_error
}

nat () {
    local _cmd=cat
    is-file bat && _cmd=bat
    is-file kat && $(kat "$@" >~/fd1 2>~/fd2) && _cmd=kat
    $_cmd "$@"
}

num () {
    vim ~/jab/local/numbers.txt
}

ps3 () {
    if [[ -z "$@" ]]; then
        ps axf | vim - +
    else ps axf | vim - +/"$*"
    fi
}

pyt () {
    local __doc__="""Run py.test with args, or default to doctests"""
    local _pythonpath=$(readlink -f .) _options="--doctest-modules --doctest-glob=*.test --doctest-glob=*.tests"
    if [[ $@ ]]; then
        if [[ $1 =~ -[d] ]]; then
            shift
        else
            _options=
        fi
    fi
    [[ $PYTHONPATH ]] && _pythonpath="$_pythonpath:$PYTHONPATH"
    PYTHONPATH="$_pythonpath" py.test $_options "$@"
}

raj () {
    pushq ~/jab
    range "$@"
    popq
}

rlf () {
    local path_=.
    [[ $1 ]] && path_="$1"
    readlink -f "$path_"
    # realpath $path_
}

sai () {
    [[ -f /usr/bin/say ]] || return
    local _one=$1
    local _voices="-v Moira"
    if [[ $_one =~ ^v(oices*)*$ ]]; then
        shift
        local _two=$1; [[ -n $_two ]] && shift
        _voices="-v?";
        if [[ $_one == "voice" ]]; then
            _voices="-v $_two"
        elif [[ $_one == v ]]; then
            local _voice=
            [[ -n $_two ]] &&  _voice=$_two
            _voices="-v $_two"
        fi
    fi
    local _message="$@"
    local _dir=
    [[ -d $_message ]] && _dir=$_message && _message=
    [[ -d "$1" ]] && _dir="$1" && shift && _message="$@"
    [[ -d $_dir ]] && _dir=$(short_dir $_dir) || _dir=
    # From https://stackoverflow.com/a/31189843/500942
    ( { { /usr/bin/say $_voices $_dir $_message >&2; } 2>&3- & } 3>&2 2>/dev/null )
}

ses () {
    local _old="$1"; shift
    local _new="$1"; shift
    echo "$@" | sed -e "s:$_old:$_new:"
}

sib () {
    . ~/.bashrc
}

sto () {
    firefox "http://stackoverflow.com/search?q=$*"
}

tel () {
    # Using "$*" instead of "$@" deliberately here
    # Side effect: args are now text, not args
    HEADLINES=${HEADLINES:-(( ${LINES:-$(screen_height)} / 2 ))}
    head -n ${1:-$HEADLINES} "$@"
    lines=$(echo "$*" | sed -e "s/ *-n.\([0-9]\+\)/\1/")
    if [[ -n $lines ]]; then
        args=$(echo "$*" | sed -e "s/^\(.*\) *-n.\([0-9]\+\)\(.*\)/\1\3/")
        echo tel $lines $args
        tail -n $lines $args
    else
        tail -n $(( ${LINES:-$(screen_height)} / 2 )) "$@"
    fi
}

tma () {
    tmux new-session -A -s jabtmux
}

tmp () {
    cde ~/tmp
}

tti () {
    tty | cut -d'/' -f3
}

vaf () {
    vim -p $(aliases) $(functons)
    sa
    sf
}

vat () {
    vimcat "$@"
}

vfg () {
    _sought="$1" && shift
    vf "$@" +/$_sought
}

vfh () {
    vim -p $( $( h1 ) | space_lines ) "$@"
}

vfr () {
    python ~/jab/src/python/vim_traceback.py "$@"
}

vgf () {
    _edit_source ~/bash/git/functons.sh  ~/.gitconfig "$@"
}

vla () {
    _edit_locals aliases.sh
}

vle () {
    _edit_locals environ.sh
}

vlf () {
    _edit_locals functons.sh
}

vla () {
    _edit_locals aliases.sh
}

vwa () {
    _edit_work aliases.sh
}

vwe () {
    _edit_work environ.sh
}

vwf () {
    _edit_work functons.sh
}

vlo () {
    v_safely $(locate "$@")
}

vpe () {
    _edit_source ~/jab/environ.d/python
}

vpr () {
    local _crappy_program_py=$1
    python _crappy_program_py | python ~/jab/src/python/vim_traceback.py
}

vtc () {
    vtr -c
}

vtr () {
    python ~/jab/src/python/tracebacks.py -e "$@"
}

VIM () {
    sudo vim "$@"
}

wtb () {
    . ~/bash/__init__.sh
}

wvb () {
    vim -p ~/bash "$@"
}

wvj () {
    vim -p ~/jab/__init__.sh "$@"
}

wvp () {
    vim -p ~/hub/pym/pym/edit/ "$@"
}

wvw () {
    vim -p ~/hub/whyp/whyp.sh "$@"
}

xib () {
    bash -x ~/.bashrc
}

# xxxx

back () {
    tput rmcup
}

bins () {
    local _name="$1"; shift
    [[ -z $_name ]] && return 1
    while [[ -n $_name ]]; do
        for root in $HOME /bin /usr; do
            find $root -wholename "bin/*$_name*" -print 2>/dev/null
        done | grep -e $_name | sort | uniq | grep $_name 2>/dev/null
        _name="$1"; shift
    done
}

bash4 () {
    /usr/local/bin/bash4 "$@"
}

bool () {
    [[ -z $* || $1 =~ ^0*$ ]] && echo False && return 1
    if whyp -q "$1"; then
        if [[ $1 == "[[" ]]; then
            eval "$@"
            local _result=$?
            [[ $_result == 0 ]] && echo True || echo False
            return $_result
        else
            "$@" 2> ~/fd2 && echo True && return 0
        fi
        echo False; return 1
    fi
    [[ $1 =~ ^0*$ ]] && echo False || echo True
    return 0
}

brew () {
    GIT= /usr/local/bin/brew "$@"
}

bump () {
    local _bump_dir=.
    local _show=
    local _get=
    if [[ $1 == show ]]; then
        _show=1
        shift
    fi
    if [[ $1 == get ]]; then
        _get=1
        shift
    fi
    local _pulled=
    if [[ $1 == pulled ]]; then
        _pulled=1
        shift
    fi
    if [[ -d "$1" ]]; then
        bump_dir="$1"
        shift
    fi
    local _name=$(basename_ $1)
    local _config=
    [[ $_name = ".bumpversion.cfg" ]] && _config="$1"
    [[ -n $_config ]] && shift
    local _bump_root=$(git_root $_bump_dir)
    local _part=${1:-patch}; shift
    if [[ -z $_show && -z $_get ]]; then
        if [[ -n $_part ]]; then
            [[ $_pulled == 1 ]] || git pull --rebase
            cd "$_bump_root"
            local _options=
            [[ -n $config ]] && _options="--config-file $_name"
            if bumpversion $_options $_part "$@"; then
                git push
                git push origin v$(bump get)
            fi
        fi
    fi
    [[ -z $_config ]] && _config="$_bump_root/.bumpversion.cfg"
    local _sought=^current_version
    if [[ -n $_show ]]; then
        grep $_sought $_config | grep --colour '\d[0-9a-z.]\+$'
    elif [[ -n $_get ]]; then
        grep $_sought $_config | sed -e 's/.*= //'
    else
        bumpversion "$@"
    fi
}


down () {
    cd ~/Downloads "$@"
    l -tr . | tail
}

hhhh () {
    echo '#' | clip_in
}

lkra () {
    lkr -a "$@"
}

left () {
    local last_command="$1"
    echo $last_command
    local last_command_line="$@"
    echo $last_command_line
}

main () {
    shift_dir "$@" && shift
    [[ -n $* ]] && cp ~/jab/src/python/main.py $1 || cp ~/jab/src/python/main.py $dir
}

mine () {
    sudo chown -R $(id -un):$(id -gn) "$@"
}

mkcd () {
    local __doc__='make a directory and start using it';
    mkd "$1"
    [[ -d "$@" ]] || return 1
    cd "$@"
}

mkpy () {
    mkd "$1"
    touch "$1"/__init__.py
}

mkv3 () {
    mkvirtualenv -v --clear --system-site-packages --relocatable --python=$(which python3) $1
    virtualenv --python=$(which python3) /Users/jab/.virtualenvs/$1
}

nose_doctests () {
    nosetests -h 2>&1 | grep -q doctest || return
    echo "--with-doctest --doctest-tests --doctest-extension=.test --doctest-extension=.tests "
}

nose_coverage () {
    nosetests -h 2>&1 | grep -q coverage || return
    echo """ \
        --with-coverage \
        --cover-erase \
        --cover-package=. \
        --cover-tests \
        --cover-html --cover-html-dir=coverage \
        """
}

nose_stopwatch () {
    [[ $1 == 1 ]] && return
    nosetests -h 2>&1 | grep -q stopwatch || return
    echo "-A \"speed!='slow'\""
}

nose_progress () {
    nosetests -h 2>&1 | grep -q progressive || return
    echo "--with-progressive "
    nose_coverage $_progress "$@"
}

nose () {
    local _there=
    [[ -d $1 ]] && _there=$1
    [[ $_there ]] && shift
    [[ $_there ]] || _there=.
    local _all=
    [[ $1 == -a ]] && _all=1
    [[ $_all ]] && shift
    (cd $_there
    NOSE_COVER_TESTS= nosetests $(nose_doctests) $(nose_coverage) $(nose_stopwatch $_all) $(nose_progress) "$@"
    )
}

sudo_console () {
    local options_= you_sir_=root
    if [[ $1 == -u ]]; then
        options_="$@"
        shift
        you_sir_="$1"
    fi
    me=$USER
    here=$(short_hostname)
    console_title_on "${you_sir_}@${here}" && \
        sudo -i $options_ bash && \
        console_title_off "${me}@${here}"
}

dicp () {
    COMMAND_FOR_SAME_FILES=cp _dixx "$1" "$2"
}

dihh () {
    COMMAND_FOR_SAME_FILES=hd _dixx "$@"
}

diic () {
    COMMAND_FOR_SAME_FILES=icdiff _dixx "$@"
}

divv () {
    COMMAND_FOR_SAME_FILES=vd _dixx "$@"
}

over () {
    tput smcup
}

popq () {
    popd >/dev/null 2>&1
}

this () {
    python -c "import this"
}

Tree () {
    tree "$@" | less -R
}

venv
vims () {
    whiches vim
}

vini () {
    vim -p $(find $( rlf ~/jab ) -name __init__.sh | lines_to_spaces)
}

# xxxxx

build () {
    if [[ -x bin/make ]]; then
        [[ -f bin/made ]] || bin/make "$@"
        if [[ -x bin/deploy ]]; then
            [[ -e bin/deployed ]] || bin/deploy "$0"
            [[ -e bin/deployed ]] && return 0
        fi
    elif [[ -f build.sh ]]; then bash build.sh "$@"
    elif [[ -f Makefile ]]; then make "$@"
    fi
}

detab () {
    local _expand=$(which expand)
    whype -q gexpand && _expand=$(whyp -f gexpand)
    if [[ -f "$1" ]]; then
        if grep -Pq "^\s*\t\s*[^ \t]" $1; then
            $_expand -i --tabs=4 $1 > /tmp/txt
            mv /tmp/txt $1
            echo detabbed
        else
            echo no tabs
        fi
    else
        echo not a file $1
    fi
}

fewer () {
    if [[ -n "$@" && -f "$1" ]]; then
        local _lines=$(wc -l "$1" | cut -d' ' -f1)
        if [[ $_lines -lt ${LINES:-$(screen_height)} ]]; then
            cat -n "$1"
        else
            lesen "$1"
        fi
    else
        cat -n
    fi
}

hello () {
    /usr/bin/say -v Moira \
        Hello, my name is Moira. \
        I am an Irish-English voice. \

}

jalanb () {
    local _root=~/src/git/jalanb
    for repo in $(readlink -f $_root/*); do
        [[ -d $repo ]] || continue
        git_dirty $repo || continue
        echo
        show_green_line $repo
        git -C $repo branch
        git -C $repo lg -n 3
        git -C $repo status | grep 'Your branch'
        git -C $repo status -s
    done
}

ncduhd () {
    sudo ncdu -x /Volumes/Macintosh\ HD/
}

ncduru () {
    sudo ncdu -x /
}

paste () {
    if [[ -z "$*" ]]; then
        echo "$ $(pbpaste)"
        $(pbpaste)
    else
        echo "# $(pbpaste)"
    fi
}

blacken () {
    black -l 79 "$@"
}

clipvim () {
    bash -x ~/jab/bin/tmp_fred.sh
}

clip_in () {
    pbcopy
    [[ "$@" =~ -q ]] || (echo "$(clipout)" | sed -e "s:^:# :")
}

clipout () {
    echo "$(pbpaste)"
}

given () {
    cat /Users/jab/jab/txt/given.jira.txt | pbcopy
    echo "copied"
    cp /Users/jab/jab/txt/given.jira.txt ~/tmp/given.txt
    vim ~/tmp/given.txt
    cat ~/tmp/given.txt | pbcopy
}

ptags () {
    local _source="$1"
    [[ -n $_source ]] || _source="."
    python ~/jab/src/python/ptags.py $_source
}

pushq () {
    pushd "$@"  >/dev/null 2>&1
}

quack () {
    local _result=1
    for $item in "$@"; do
        if _like_duck $item; then
            python  $1
            _result=0
        fi
    done
    return $_result
}

range () {
    local destination=.
    if [[ -n "$*" ]]; then
        local cde_script=~/hub/cde/cd.py
        if ! destination=$(PYTHONPATH=$python_directory python $cde_script "$@" 2>&1); then
            echo "$destination"
            return 1
        fi
    fi
    local real_destination=$(PYTHONPATH=$python_directory python -c "import os; print os.path.realpath('$destination')")
    if [[ $destination != $real_destination ]]; then
        echo "ranger ($destination ->) $real_destination"
        destination=$real_destination
    elif [[ $destination != $1 && $1 != "-" ]]; then
        echo "ranger $destination"
    fi
    pushq "$destination"
    source $(which ranger) $(which ranger)
    console_whoami
    return 0
}

taocl () {
    curl -s https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README.md |
    pandoc -f markdown -t html |
    xmlstarlet fo --html --dropdtd |
    xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
    xmlstarlet unesc | fmt -80
}

ylint () {
    python $HOME/jab/src/python/ylint.py "$@"
}

# xxxxxx

bumper () {
    if [[ -z $1 ]]; then
        echo Please specify branch to bump >&2
        return 1
    fi
    local _bump_branch=$1; shift
    local _current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [[ $_current_branch != $_bump_branch ]]; then
        if git co $_bump_branch; then
            return
        fi
    fi
    git pull --rebase
    bump pulled "$@"
    git push
}

cd_one () {
    clear
    shift_dir "$@" && shift
    cde $dir
}

has_py () {
    has_ext py "$@"
}

header () {
    head -n 1 "$@"
}

howdoi () {
    /usr/local/bin/howdoi -c -a "$@"
}

_lesser () {
    less -R "$@"
}

lesen () {
    less -NR "$@"
}

mkvenv () {
    local dir_=. venv_dir_=
    if [[ -d "$1" ]]; then
        dir_="$1"
        shift
    fi
    venv_dir_="$dir_/.venv"
    deactivate
    rm -rf $venv_dir_
    python3 -m venv "$venv_dir_"
    . "$venv_dir_/bin/activate"
    piup
}

tailer () {
    tail -n 1 "$@"
}

show_line () {
    local _prefix=$1; shift
    local _server= _suffix=
    [[ $1 ]] && _server=$1
    [[ $2 ]] && _suffix=", $2"
    echo "$_prefix ${_server}$_suffix"
}


online_all () {
    is_online www.google.com
    local server_=
    if runnable worker; then
        for server_ in bots git wmp eop dupont corteva eopdev; do
            is_online $(worker $server_)
        done
    fi
    for server_ in mac.local book.local mini.local; do
        is_online $server_
    done
}

please () {
    local _command=$(history -p !-1)
    [[ "$@" ]] && _command="$@"
    green_line "$ sudo $_command"
    sudo $_command
}

qwerty  () {
    echo '` 1 2 3 4 5 6 7 8 9 0 - = '
    echo 'q w e r t y u i o p [ ]'
    echo 'a s d f g h j k l ;' "'" '#'
    echo '\ z x c v b n m , . /'
}

run_as () {
    local username_="$1"
    shift
    if [[ $username_ == root ]]; then
        ru "$@"
        return $?
    elif [[ ! $username_ ]]; then
        return 1
    fi
    [[ "$@" ]] && sudo -u $username_ "$@" || sudo_console -u $username_
}

# xxxxxxx

aliases () {
    local _sub_dir="src/bash"
    [[ $1 == -l ]] && _sub_dir="local"
    [[ $1 == -w ]] && _sub_dir="work"
    echo "$HOME/jab/${_sub_dir}/aliases.sh"
}

clearly () {
    clear
    l
}

doctest () {
    local __doc__="""doctest args"""
    local _pythonpath=$(readlink -f .)
    [[ $PYTHONPATH ]] && _pythonpath="$PYTHONPATH:$_pythonpath"
    (PYTHONPATH="$_pythonpath" python -m doctest "$@")
}

has_ext () {
    [[ -n $(ls ${2:-.}/*.$1 2>/dev/null | grep -v -e fred -e log  | head -n 1) ]]
}

is_a_dir () {
    [[ -d "$1" ]] || echo "\"$1\" is not a directory" >&2
    [[ -d "$1" ]]
}

playbook () {
    ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook "$@"
}

relpath () {
    python ~/jab/src/python/relpath.py "$@"
}

whiches () {
    local _which=$(which $1)
    local _located=
    for _located in $(locate -f $1); do
        echo
        if $_located --version >/dev/null 2>&1; then
            $_located --version | grep --color ' [0,7,8]\.[0-9]'
            ll $_located | grep --color $_which || ll $_located
        fi
    done
}

umports () {
    for file in "$@"; do
        reorder-python-imports "$file"
        python3 ~/jab/bin/imports -ume "$file"
    done
}

# xxxxxxxx

doctests () {
    py.test --doctest-modules --doctest-glob=*.test --doctest-glob=*.tests
}

functons () {
    local _sub_dir="src/bash"
    [[ $1 == -g ]] && _sub_dir="$_sub_dir/git"
    [[ $1 == -l ]] && _sub_dir="local"
    [[ $1 == -w ]] && _sub_dir="work"
    echo "$HOME/jab/${_sub_dir}/functons.sh"
}

short_hostname () {
    echo ${HOSTNAME:-$(hostname -s)}
}

maketest () {
    local path="$1"
    if [[ ! -f "$path" ]]; then
        echo $path is not a file >&2
        return 1
    fi
    local filename=$(basename_ $path)
    local stem=${filename%.*}
    local classname=$(python -c "print 'Test%s' % '$stem'.title()")
    local methodname="test_$stem"
    local test_file=$(python -c "import os; print os.path.join(os.path.dirname(os.path.abspath('$path')), 'test', 'test_%s' % os.path.basename('$path'))")
    if [[ -f "$test_file" ]]; then
        echo $test_file is already a file >&2
        return 1
    fi
    local test_dir=$(files_dirs $test_file)
    [[ -d "$test_dir" ]] || mkdir -p "$test_dir"
    sed -e s/TestClass/$classname/ -e s/test_case/$methodname/ ~/jab/src/python/test_.py > $test_file
}

pong_work () {
    pong -t3 $1.$(work $1)
}

ssh_tippy () {
    at_home tippy
    vagrant status 2>&1 | grep -q -e 'poweroff' -e 'Run .vagrant up' && vagrant up
    vagrant ssh
}

sudo_ssh () {
    local _host=$1; shift
    ssh -t -q $_host "sudo ""$@"
}

thirteen () {
    cd_one
    3d "$@"
}

todo_edit () {
    local todo_txt="~/jab/todo.txt"
    local git_options="--git-dir=~/jab/.git --work-tree=~/jab"
    if [[ -f todo.txt ]]; then
        todo_txt=todo.txt
        git_options=
    elif [[ -f TODO.md ]]; then
        todo_txt=TODO.md
        git_options=
    fi
    v $todo_txt
    if git status -s ~/jab/todo.txt 2>&1 | grep -q "M.*$(basename_ ~/jab/todo.txt)"; then
        git add ~/jab/todo.txt
        git commit -m'more or less stuff to be done' ~/jab/todo.txt
    elif svn stat "~/jab/todo.txt" 2>&1 | grep -q "M .* ~/jab/todo.txt"; then
        svn ci -m'more or less stuff to be done' "~/jab/todo.txt"
    fi
}

files_dirs () {
    local __doc__="""echo all args' directories"""
    local _result=1
    for _arg in "$@"; do
        [[ -e "$_arg" ]] || continue
        dirname "$_arg"
        _result=0
    done
    return $_result
}

dirnames () {
    local __doc__="""echo all directories in args"""
    local _result=1
    for _arg in "$@"; do
        [[ -e "$_arg" ]] || continue
        [[ -d "$_arg" ]] && echo "$_arg" || dirname "$_arg"
        _result=0
    done
    return $_result
}

twkgit00 () {
    is_a_file .git/config || return 1
    sed -i -e s/$(work twkgit30)/$(work git)/ .git/config
    sed -i -e s/$(work twkgit20)/$(work bots)/ .git/config
    sed -i -e s/$(work twkgit31)/$(work bots)/ .git/config
    sed -i -e 's!https://$(work git)!https://$(work git)!' .git/config
    sed -i -e 's!http://$(work bots)!https://$(work bots)!' .git/config
}

twkgit30 () {
    is_a_file .git/config || return 1
    local _twkgit30=$(work twkgit30)
    sed -i -e s/$(work git)/${_twkgit30}/ .git/config
    sed -i -e s/$(work twkgit20)/${_twkgit30}/ .git/config
    sed -i -e s/$(work tools)/${_twkgit30}/ .git/config
    sed -i -e s/$(work tooltest)/${_twkgit30}/ .git/config
    sed -i -e 's!http://${_twkgit30}!https://${_twkgit30}!' .git/config
}

# xxxxxxxxx

basename_ () {
    local _result=1
    for _arg in "$@"; do
        [[ -e "$_arg" ]] || continue
        basename "$_arg"
        _result=0
    done
    return $_result
}

first_num () {
    num=$(python ~/jab/src/python/first_num.py "$@")
    args=$(python ~/jab/src/python/first_num.py --Invert "$@")
    [[ -n $num ]]
}

is_a_file () {
    [[ -f "$1" ]] || echo "\"$1\" is not a file" >&2
    [[ -f "$1" ]]
}

viewstyle () {
    git status --porcelain "$1" | grep -q .  || return 1
    git dv "$1"
    git add "$1"
    git commit
}

autostyle () {
    reorder-python-imports "$1"
    viewstyle "$1"
    autoflake -i --remove-all-unused-imports "$1"
    viewstyle "$1"
    ~/jab/bin/imports --tmp --unused "$1";
    viewstyle "$1"
    autopep8 -a -a -a -i "$1"
    viewstyle "$1"
    vim "$1"; git add "$1"; git commit
}

# xxxxxxxxxx
_like_duck () {
    has_py "$*"
}

al_email () {
    echo "$@@al-got-rhythm.net"
}


continuing () {
    local _answer=$(ask "Continue ?")
    [[ $_answer =~ [yY] ]]
}

jab_hub () {
    local _dir=
    local _dirs=
    [[ $1 == -d ]] && _dirs=1
    [[ $1 == -D ]] && _dirs=2
    (
        cd ~/hub;
        local _result=$(
        grep slack -H */.travis.yml | \
            sed -e "s/:.*//" -e "s:..travis.yml::" | \
            grep -v -e old -e master -e suds | \
            sort | uniq
        )
        [[ $_dirs == 1 ]] && for _dir in $_result; do short_dir $_dir; done
        [[ $_dirs == 2 ]] && for _dir in $_result; do rlf $_dir; done
        [[ $_dirs ]] || echo $_result | spaces_to_lines
    )
}

jab_scripts () {
    python ~/jab/src/python/scripts.py "$@"
}

make_it_so () {
    please "$@"
}

thirty_two () {
    3l "$@"
    2
}

# _______________

_diff_two_files () {
    ! diff -q $1 $2 >/dev/null 2>&1
}

_any_diff () {
    _diff_two_files $1 $2 && return 0
    [[ -z $3 ]] && return 1
    _diff_two_files $1 $3 && return 0
    _diff_two_files $2 $3 && return 0
    return 1
}

# xxxxxxxxxx

# xxxxxxxxxxx

spaces_to_lines () {
    tr ' ' '\n'
}
lines_to_spaces () {
    tr '\n' ' '
}

# xxxxxxxxxxxx

blank_script () {
    [[ -f "$1" ]] && return
    echo "#! /bin/bash" > $1
    echo "" >> $1
}

project_root () {
    git_root "$@" 2>/dev/null && return 0
    local _arg= _file= _path=
    for _arg in "$@"; do
        for _path in $(~/jab/bin/parents $_arg); do
            for _file in .bumpversion.cfg .gitignore .travis.tml setup.py requirements.txt README.rst readme.md LICENSE tox.ini; do
                if [[ -f $_path/$_file ]]; then
                    echo $_path
                    return 1
                fi
            done
        done
    done
    return 1
}

# xxxxxxxxxxxxx

disable_spctl () {
    sudo spctl --master-disable
}

show_functions () {
    local __doc__="""You're mad!!"""
    echo all functions? here ye go
    declare -f | grep "^[^ ]* ()"
}

console_hello () {
    local me=$USER
    local here=$(short_hostname)
    export PYTHON=${PYTHON:-python}
    console_title_on "python@${here}" && \
        $PYTHON "$@" && \
        console_title_off "${me}@${here}"
}

one_two_three () {
    clear
    cd_one "$@"
    todo_show
    if first_num "$@"; then
        3d $num --noreport $args
    else
        3d 1 --noreport "$@"
    fi
    l $(ls1 -p | grep -v "\(pyc\|/\)$")
}

insert_commas () {
    # From http://shallowsky.com/blog/linux/cmdline/sed-improve-comma-insertion.html
    sed ':a;s/\b\([0-9]\+\)\([0-9]\{3\}\)\b/\1,\2/;ta'
}

sudo_default () {
    sudo_ssh default "$@"
}

three_two_one () {
    clear
    3d 2 "$@"
    todo_show
    cd_one "$@"
}

# xxxxxxxxxxxxxx

console_whoami () {
    console_title_on $USER@$(short_hostname)...$(basename_ "$PWD")
}

source_aliases () {
    local __doc__='source files which have aliases and remember the filenames'
    ALIASES="$ALIASES:$1"
    source $1
}

# xxxxxxxxxxxxxxx

# xxxxxxxxxxxxxxxx

console_title_on () {
    if [[ -n $TERM_PROGRAM && $TERM_PROGRAM == "iTerm.app" ]]; then
        echo -e "\033]0;$1\007" # http://stackoverflow.com/a/6887306/500942
    elif env | grep -iq konsole 2> ~/fd2; then
        #dcop $KONSOLE_DCOP_SESSION renameSession $1
        echo -e "\033]0;$1\007" # http://stackoverflow.com/a/21380108/500942
    elif env | grep -iq gnome.terminal; then
        echo -e "\033]0;$1\007" # http://askubuntu.com/a/22417/130752
    elif [[ -n $TERM ]]; then
        if [[ $TERM == "linux" ]]; then
            echo -e "]1;$1"
        elif [[ $TERM =~ xterm ]]; then
            echo -ne "\033]0;$1\007" # http://askubuntu.com/a/22417/130752
        fi
    else
        echo "Title: $1"
    fi
}

show_functons_in ()
{
    for f in $(grep "^[a-z][a-z_]\+ .. .$" $1  | sed -e "s: .. .$::"); do
        whype -v $f
    done | fewer
}

# xxxxxxxxxxxxxxxxx

console_title_off () {
    if [[ -n $TERM_PROGRAM && $TERM_PROGRAM == "iTerm.app" ]]; then
        echo -e "]0;$1"
    elif env | grep -iq konsole 2> ~/fd2; then
        dcop $KONSOLE_DCOP_SESSION renameSession $1
    elif env | grep -iq gnome.terminal; then
        echo -e "\033]0;$1\007" # http://askubuntu.com/a/22417/130752
    elif [[ -n $TERM ]]; then
        if [[ $TERM == "linux" ]]; then
            echo -e "]1;$1"
        elif [[ $TERM =~ xterm ]]; then
            echo -e "\033]0;$1\007" # http://askubuntu.com/a/22417/130752
        fi
    else
        echo "Title: $1"
    fi
}

# _xxxxxxxxxxxxxxxxxxx

_publish_Localhost () {
    /bin/bash ~/jab/bin/publish_host.sh $HOME/public_html/index.html
}

# functions starting with an underscore are intended for use within this file only

_dixx () {
    local _source_dir="$1"
    local _destination_dir="$2"
    local number_in_both=$(_divv_get_difference "$1" "$2" | grep Files | wc -l)
    if [[ $number_in_both -gt 0 ]]; then
        echo
        echo "# Files 1 and 2 differ"
        _divv_get_difference "$1" "$2" | grep Files | sed -e 's/Files /'$COMMAND_FOR_SAME_FILES' "/' -e 's/ and /" "/' -e 's/ differ/"/'
    fi
    local number_in_source=$(_divv_get_difference "$1" "$2" | grep "Only in $_source_dir" | wc -l)
    if [[ $number_in_source -gt 0 ]]; then
        echo
        echo "Only in $_source_dir"
        _divv_get_difference "$1" "$2" | grep "Only in $_source_dir" | sed -e "s/Only in/vim /" -e "s|: |/|"
    fi
    local number_in_destination=$(_divv_get_difference "$1" "$2" | grep "Only in $_destination_dir" | wc -l)
    if [[ $number_in_destination -gt 0 ]]; then
        echo
        echo "Only in $_destination_dir"
        _divv_get_difference "$1" "$2" | grep "Only in $_destination_dir" | sed -e "s/Only in/vim /" -e "s|: |/|"
    fi
}

_edit_source () {
    local filepath=$1
    shift
    blank_script $filepath
    filedir=$(files_dirs $filepath)
    if [[ $filedir == "." ]]; then
        v_safely $filepath "$@"
    else
        pushq $filedir
        v_safely $filepath "$@"
        popq
    fi
    if [[ $filepath =~ alias ]]; then
        source_aliases $filepath
    else
        . $filepath "$@"
    fi
}

_edit_locals () {
    local local_dir=~/jab/local
    [[ -d "$local_dir" ]] || mkdir -p $local_dir
    _edit_source $local_dir/$1
}

_edit_work () {
    local local_dir=~/jab/work
    [[ -d "$local_dir" ]] || mkdir -p $local_dir
    _edit_source $local_dir/$1
}

_divv_get_difference () {
    local _source_dir="$1"
    local _destination_dir="$2"
    local _source_gitignore=
    [[ -f "$_source_dir/.gitignore" ]] && _source_gitignore="--exclude-from=$_source_dir/.gitignore"
    local destination_gitignore=
    [[ -f "$_destination_dir/.gitignore" ]] && destination_gitignore="--exclude-from=$_destination_dir/.gitignore"
    diff -q -r \
        --exclude=.svn \
        --exclude=.git \
        --exclude=.DS_Store \
        --exclude="*.fail" \
        --exclude="*.py[co]" \
        --exclude=tags \
        --exclude=".*sw[po]" \
        --exclude=tmp \
        --exclude="*~" \
        --exclude="*.beam" \
        --exclude="*.a" \
        --exclude="*.o" \
        --exclude=.gitignore \
        $_source_gitignore \
        $destination_gitignore \
    "$_source_dir" "$_destination_dir" 2> ~/fd2
}

unremembered () {
    shift
    blank_script $filepath
    filedir=$(files_dirs $filepath)
    if [[ $filedir == "." ]]; then
        v_safely $filepath
    else
        pushq $filedir
        v_safely $filepath
        popq
    fi
    if echo $filepath | grep -q alias; then
        source_aliases $filepath
    else
        . $filepath "$@"
    fi
}

copy_from_work_server () {
    local _server_name=$1
    local _source="$2"
    local _source_dir=$(dirnames "$_source")
    local _here_root=$(homework $_server_name)
    [[ -d $_here_root ]] || mkdir -p $_here_root
    local _here_path=$_here_root/"$_source_dir"
    [[ -d "$_here_path" ]] || mkdir -p "$_here_path"
    rsync -av $_server_name:"$_source" "$_here_path"
}

jalanb_hub ()
{
    ( cd ~/hub;
    grep slack -H */.travis.yml | sed -e "s/:.*//" -e "s:..travis.yml::" | grep -v -e old -e master -e suds | sort | uniq )
}
