from perlbase:latest

# Setup home environment
run useradd risugg --shell /bin/zsh -m -d /home/risugg --password risugg -u7768 -g20

workdir /home/risugg
env HOME /home/risugg
env EDITOR=vim INSIDE_DOCKER=1
add src/files.tar /home/risugg
#add src/vimrc /home/risugg/.vimrc
#add src/vim /home/risugg/.vim
#add src/ssh /home/risugg/.ssh
#add src/tmux.conf /home/risugg/.tmux.conf
#add src/itd.yml /home/risugg/.tmuxinator/itd.yml

user risugg
CMD ["/bin/zsh"]
