from ubuntu:14.10

run apt-get update -y
run apt-get install -y zsh cmake pkg-config build-essential wget git curl vim cmake screen tmux ruby
run gem install tmuxinator

run mkdir -p /tmp
workdir /tmp
run wget http://www.cpan.org/src/5.0/perl-5.20.2.tar.gz
run cat perl-5.20.2.tar.gz | gunzip | tar -xvf -
workdir /tmp/perl-5.20.2
run sh ./Configure -de && make && make install
run /usr/local/bin/perl -MCPAN -e "notest install Carton"
run /usr/local/bin/perl -MCPAN -e "notest install local::lib"
workdir /
