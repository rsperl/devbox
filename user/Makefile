
info:
	@echo Possible targets are:
	@echo "  build	- build docker container"
	@echo "  run	- run /bin/bash for devbox"
	@echo
	@echo "  cleanimages - clean up all untagged docker images"
	@echo "  cleanexited - clean up all exited docker containers"
	@echo ""

copy:
	rm -rf src
	mkdir src
	cp -rp ${HOME}/.ssh src/ssh
	cp -rp ${HOME}/.vimrc src/vimrc
	cp -rp ${HOME}/.vim src/vim
	cp -rp ${HOME}/.tmux.conf src/tmux.conf
	cp -rp ${HOME}/.tmuxinator/itd.yml src/itd.yml


build: copy
	docker build .

run:
	docker run --name dev -v /Users/${USER}/docker_vol:/home/dev/shared -it devbox /bin/bash

cleanimages:
	docker rmi `docker images -q -f dangling=true`

cleanexited:
	docker rm `docker ps -q -f status=exited`
