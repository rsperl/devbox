FROM ubuntu_base:latest

MAINTAINER Richard.Sugg@gmail.com

LABEL com.sas.it.user=1

ENV HOME=/home/dev SHELL=/bin/zsh EDITOR=vim INSIDE_DOCKER=1

# Setup home environment
RUN apt-get update -y; \
        apt-get install -y tmux vim; \
            gem install tmuxinator; \
            useradd dev --shell $SHELL -m -d $HOME  --password dev; \
        mkdir -p $HOME/git

USER    dev
WORKDIR $HOME

ENTRYPOINT ["/bin/zsh"]
