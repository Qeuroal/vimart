.PHONY: install uninstall clean rmvim

install:
	@bash scripts/install.sh

local:
	@bash scripts/local_install.sh

uninstall:
	@bash scripts/uninstall.sh

clean:
	@yes y | bash scripts/uninstall.sh
	@if [ -e ./vimart_envs  ]; then rm -i ./vimart_envs; fi

rmvim:
	@make uninstall -f ~/.vimsrc
	@rm -rf /usr/local/share/vim/vim82
	@rm -f /usr/local/bin/eview
	@rm -f /usr/local/bin/evim
	@rm -f /usr/local/bin/ex
	@rm -f /usr/local/bin/gview
	@rm -f /usr/local/bin/gvim
	@rm -f /usr/local/bin/gvim
	@rm -f /usr/local/bin/gvimdiff
	@rm -f /usr/local/bin/rgview
	@rm -f /usr/local/bin/rgvim
	@rm -f /usr/local/bin/rview
	@rm -f /usr/local/bin/rvim
	@rm -f /usr/local/bin/rvim
	@rm -f /usr/local/bin/view
	@rm -f /usr/local/bin/vim
	@rm -f /usr/local/bin/vimdiff
	@rm -f /usr/local/bin/vimtutor
	@rm -f /usr/local/bin/xxd
	@rm -f /usr/local/man/man1/eview.1
	@rm -f /usr/local/man/man1/evim.1
	@rm -f /usr/local/man/man1/ex.1
	@rm -f /usr/local/man/man1/gview.1
	@rm -f /usr/local/man/man1/gvim.1
	@rm -f /usr/local/man/man1/gvimdiff.1
	@rm -f /usr/local/man/man1/rgview.1
	@rm -f /usr/local/man/man1/rgvim.1
	@rm -f /usr/local/man/man1/rview.1
	@rm -f /usr/local/man/man1/rvim.1
	@rm -f /usr/local/man/man1/view.1
	@rm -f /usr/local/man/man1/vim.1
	@rm -f /usr/local/man/man1/vimdiff.1
	@rm -f /usr/local/man/man1/vimtutor.1
	@rm -f /usr/local/man/man1/xxd.1

