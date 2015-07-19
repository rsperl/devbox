FROM ubuntu_base:latest

MAINTAINER Richard.Sugg@gmail.com

LABEL com.sas.it.user=1

# Setup home environment
RUN apt-get install -y tmux; \
        gem install tmuxinator; \
        useradd risugg --shell /bin/zsh -m -d /home/risugg --password risugg -u7768 -g20

WORKDIR /home/risugg
ENV HOME=/home/risugg
ENV SHELL=/bin/zsh
ENV EDITOR=vim INSIDE_DOCKER=1

ENTRYPOINT ["/bin/zsh"]
