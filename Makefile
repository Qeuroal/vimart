.PHONY: install uninstall clean

install:
	@bash install.sh

uninstall:
	@bash uninstall.sh

clean:
	@sudo rm -rf ${HOME}/.vim
	@sudo rm -rf ${HOME}/.vimart
	@sudo rm -rf ${HOME}/.vimrc.ycm.config
	@sudo rm -rf ${HOME}/.vimrc.custom.config
	@sudo rm -rf ${HOME}/.vimrc.custom.plugins
	@yes y | bash uninstall.sh

