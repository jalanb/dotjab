#! /bin/cat

realdir () {
    local _p=
    for _p in $(realpath "$@"); do
        dirname "$_p"
    done
}

. ~/bash/add_to_a_path.sh
. ~/bash/crayons.sh

source_pythonpath () {
    . "$1"
    show_pythonpath "$1"
}

show_pythonpath () {
    show_green_line PYTHONPATH==$PYTHONPATH after "$1"
}

export WHYP=~/hub/whyp/whyp
. $WHYP.sh
export WHYP_EDITOR=v
export ACKVIM=~/hub/ackvim/ackvim
. $ACKVIM.sh
# . $WHYP.sh
export PYTH=~/hub/pyth/pyth
. $PYTH.sh

. ~/jab/environ.d/__init__.sh
. ~/jab/src/bash/__init__.sh
. ~/jab/src/bash/__cd__.sh
. ~/jab/local/__init__.sh optional
. ~/jab/work/__init__.sh optional

cde_activate_venv ~/jab/.venv
ACTIVE_PYTHON=$(which python)

