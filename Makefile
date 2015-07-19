SHELL=/bin/bash

info:
	@echo Possible targets are:
	@echo "  build	- build docker container"
	@echo "  start	- start a service"
	@echo "  shell  - run a shell"
	@echo "  copy   - copy needed files for devbox"
	@echo
	@echo "  cleanimages - clean up all untagged docker images"
	@echo "  cleanexited - clean up all exited docker containers"
	@echo ""

.PHONY: copy build

copy:
	rm -rf src
	mkdir src
	tar -C${HOME} -cf src/files.tar .docker.env .zsh-custom .zshrc .oh-my-zsh .myenv.zsh .ssh .vimrc .vim .tmux.conf .tmuxinator


build: copy
	docker build -t dev .

shell:
	@cname=dev; \
	for i in `seq 1 10`; do \
		tryname=$$cname$$i; \
		name_exists=`docker ps --filter name=$$tryname | grep -v 'CONTAINER ID' | wc -l | sed -e 's/ //g'`; \
		if [ "$$name_exists" = 0 ] ; then \
			cname=$$tryname; \
			break; \
		fi; \
	done; \
	echo cname=$$cname
	echo docker run \
		--rm \
		-it \
		--name $$cname \
		--hostname $$cname \
		-v $$HOME/git:/home/dev/git \
		dev

cleanimages:
	docker rmi `docker images -q -f dangling=true`


# vim:noexpandtab:ts=8:sw=8:ai
