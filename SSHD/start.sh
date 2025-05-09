#!/usr/bin/env bash
# entrypoint.sh
set -e

function main() {
unlink /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
/etc/init.d/cron restart
/etc/init.d/postfix restart
/usr/sbin/sshd -D -e -f /etc/ssh/sshd_config
}

main "$@"
