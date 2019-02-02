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

.PHONY: clean
clean:
	rm -rf $(DIR_DOT_SSH)

# End of File

