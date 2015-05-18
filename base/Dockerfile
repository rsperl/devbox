from ubuntu:14.10

run apt-get update -y
run apt-get install -y zsh cmake pkg-config build-essential wget git curl vim cmake screen tmux ruby openssl libcrypt-ssleay-perl libnet-ssleay-perl libexpat1-dev mysql-common mysql-client libmysqlclient-dev
run gem install tmuxinator

run mkdir -p /data
workdir /data
add src/perl.tar /data
run ln -s perl-5.20.2 perl
workdir /
