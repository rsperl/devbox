from perlbase:latest

label com.sas.it.user=1

# Setup home environment
run useradd risugg --shell /bin/zsh -m -d /home/risugg --password risugg -u7768 -g20

workdir /home/risugg
env HOME /home/risugg
env EDITOR=vim INSIDE_DOCKER=1
add src/files.tar /home/risugg

user risugg
entrypoint ["/bin/zsh"]
