.PHONY: install uninstall clean

install:
	@bash scripts/install.sh

uninstall:
	@bash scripts/uninstall.sh

clean:
	@sudo rm -rf ${HOME}/.vim
	@sudo rm -rf ${HOME}/.vimart
	@sudo rm -rf ${HOME}/.vimrc.ycm.config
	@sudo rm -rf ${HOME}/.vimrc.custom.config
	@sudo rm -rf ${HOME}/.vimrc.custom.plugins
	@yes y | bash scripts/uninstall.sh

