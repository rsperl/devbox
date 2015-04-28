from devboxbase:latest

# Setup home environment
run useradd dev --shell /bin/bash --password dev
run mkdir /home/dev && chown -R dev: /home/dev
run mkdir -p /home/dev/bin /home/dev/shared /home/dev/.tmuxinator
env PATH /home/dev/bin:$PATH
env PKG_CONFIG_PATH /home/dev/lib/pkgconfig
env LD_LIBRARY_PATH /home/dev/lib

workdir /home/dev
env HOME /home/dev
env EDITOR vim
add src/vimrc /home/dev/.vimrc
add src/vim /home/dev/.vim
add src/ssh /home/dev/.ssh
add src/tmux.conf /home/dev/.tmux.conf
add src/itd.yml /home/dev/.tmuxinator/itd.yml

run chown -R dev: /home/dev
user dev
