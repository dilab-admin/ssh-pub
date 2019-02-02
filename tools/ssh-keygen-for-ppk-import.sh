#!/bin/bash
#
# Convert OpenSSH to SSH2
#
KEYS=id_ed25519

cd ~/.ssh && \
	cp ${KEYS} ${KEYS}-for-ppk && \
	ssh-keygen -p -f ${KEYS}-for-ppk

# End of File
