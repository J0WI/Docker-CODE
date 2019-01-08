#!/bin/sh

# Restart when /etc/loolwsd/loolwsd.xml changes
[ -x /usr/bin/inotifywait -a /usr/bin/killall ] && (
	/usr/bin/inotifywait -e modify /etc/loolwsd/loolwsd.xml
	echo "$(ls -l /etc/loolwsd/loolwsd.xml) modified --> restarting"
	/usr/bin/killall -1 loolwsd
) &

# Start loolwsd
su -c "/usr/bin/loolwsd --version --o:sys_template_path=/opt/lool/systemplate --o:lo_template_path=/opt/collaboraoffice6.0 --o:child_root_path=/opt/lool/child-roots --o:file_server_root_path=/usr/share/loolwsd ${extra_params}" -s /bin/bash lool
