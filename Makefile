#
#
#
INSTALL = /usr/bin/install
MKDIR = /usr/bin/mkdir
#
DIR_TOP = $(HOME)
DIR_DOT_SSH = $(HOME)/.ssh

$(eval USER_ID := $(shell id -u))
$(eval GROUP_ID := $(shell id -g))

public_key_file = authorized_keys

tools_dir = tools
tools = $(tools_dir)/ssh-keygen-for-ppk-import.sh

.PHONY: all
all:
	@echo 'use make install -D PREIFX=(dir of dot.ssh)'

.PHONY: install
install: install_public_keys_dir install_public_keys

.PHONY: install_public_keys
install_public_keys:
	$(INSTALL) --target-directory=$(DIR_DOT_SSH) -g $(GROUP_ID) -o $(USER_ID) -m 400 $(public_key_file)

.PHONY: install_public_keys_dir
install_public_keys_dir:
	$(INSTALL) -g $(GROUP_ID) -o $(USER_ID) -m 750 -d $(DIR_DOT_SSH)

.PHONY: install-tools
install-tools:
	$(INSTALL) -g $(GROUP_ID) -o $(USER_ID) -m 750 -d $(DIR_DOT_SSH)/$(tools_dir)
	$(INSTALL) --target-directory=$(DIR_DOT_SSH)/$(tools_dir) -g $(GROUP_ID) -o $(USER_ID) -m 500 $(tools)

.PHONY: clean
clean:
	rm -rf $(DIR_DOT_SSH)/$(public_key_file)
	rm -rf $(DIR_DOT_SSH)/$(tools_dir)

# End of File
