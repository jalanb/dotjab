#! /bin/bash

make_git () {
    sudo yum -y groupinstall "Development Tools"
    sudo yum -y install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel curl-devel
    # For latest release see $GITHUB/git/git/releases
    GIT_VERSION=2.23.0
    GITHUB=https://jalanb@github.com
    wget $GITHUB/git/git/archive/v${GIT_VERSION}.tar.gz
    tar xvf v${GIT_VERSION}.tar.gz
    cd git-${GIT_VERSION}
    make configure
    ./configure --prefix=/usr/local
    sudo make install
}

main () {
    sudo timedatectl set-timezone Europe/Dublin
    make_git
}

main
