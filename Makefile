.PHONY: install uninstall clean

install:
	@bash scripts/install.sh

local:
	@bash scripts/local_install.sh

uninstall:
	@bash scripts/uninstall.sh

clean:
	@yes y | bash scripts/uninstall.sh
	@if [ -e ./vimart_envs  ]; then rm -i ./vimart_envs; fi

