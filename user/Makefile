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

copy:
	rm -rf src
	mkdir src
	tar -C${HOME} -cf src/files.tar .docker.env .zsh-custom .zshrc .oh-my-zsh .myenv.zsh .ssh .vimrc .vim .tmux.conf .tmuxinator


build: copy
	docker build -t dev .

start:
	docker-compose up ${SERVICE}

shell:
ifeq (${SERVICE},)
	@echo "set env var SERVICE"
	@exit 1;
endif
	docker-compose run --entrypoint /bin/zsh ${SERVICE}

cleanimages:
	docker rmi `docker images -q -f dangling=true`

cleanexited:
	docker rm `docker ps -q -f status=exited`

# vim:noexpandtab:ts=8:sw=8:ai
