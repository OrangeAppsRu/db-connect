 #!/usr/bin/env bash
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
cp -fv /user/.bash_profile ${HOME}/.bashrc
echo "" > ${HOME}/.sudo_as_admin_successful
exec sleep infinity