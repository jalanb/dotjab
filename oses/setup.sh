use () {
    local _setup=
    [[ -d $1 -f "$1"/setup.sh ]] && _setup="$1"/setup.sh
    [[ -f $1 ]] && _setup=$1
    . $_setup
}

use jab/setup.sh

# sudo rm -rf ~/Downloads/*
# 
# that was a bit severe!

# Install dotjab

cd ~/hub

# If you are reading this then dotjab ($GITHUB/jalanb/jab) is already cloned
git clone $GITHUB/jalanb/pysyte
git clone $GITHUB/jalanb/whyp
git clone $GITHUB/jalanb/cde
git clone $GITHUB/jalanb/ackvim
pip install git+https://github.com/jeffkaufman/icdiff.git

cd ~/jab
use ~/jab/oses/linux/
bash make_software.sh

# set up python
pip install pysyte


# set up CentOS
cd ~/jab/server/linux/centos
bash install_software.sh


# set up Gnome
cd ../gnome
bash make_vim_default_editor.sh
cd ~/jab
test -d local || mkdir local
cd local


# set up JAb

cd ~/jab/server/jab
bash clean_directories.sh
bash home/.link
