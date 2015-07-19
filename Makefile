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
	docker build -t my-dev-env .

shell:
	docker run --rm -it \
		-v $$HOME:/home/risugg \
		my-dev-env

cleanimages:
	docker rmi `docker images -q -f dangling=true`

# vim:noexpandtab:ts=8:sw=8:ai
