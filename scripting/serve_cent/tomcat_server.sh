#/bin/bash

# This is a script to install and startup an tomcat server
# at port 8080

ver=8.5
package_name=$(echo "tomcat"$ver)

update_repository() {
	sudo yum install epel-release
	sudo yum update -y || { echo "Error while updating repository"; return; }
}

create_tomcat_user() {
	sudo groupadd tomcat
	sudo mkdir /opt/tomcat
	sudo useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
}

download_tomcat() {
	wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz
}

extract_tomcat() {
	sudo tar -zxvf apache-tomcat-8.5.20.tar.gz -C /opt/tomcat --strip-components=1
}

set_permissions() {
	cd /opt/tomcat
	sudo chgrp -R tomcat conf
	sudo chmod g+rwx conf
	sudo chmod g+r conf/*
	sudo chown -R tomcat logs/ temp/ webapps/ work/
	sudo chgrp -R tomcat bin
	sudo chgrp -R tomcat lib
	sudo chmod g+rwx bin
	sudo chmod g+r bin/*
}

create_systemservice() {
	echo $PWD
	sudo cp tomcat.service /etc/systemd/system/
}

install_security_apps() {
	sudo yum install haveged
	sudo systemctl start haveged.service
	sudo systemctl enable haveged.service
}

configure_firewall() {
	sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
	sudo firewall-cmd --reload
}

register_tomcat_service() {
	sudo systemctl start tomcat.service
	sudo systemctl enable tomcat.service
}

install_server() {
	echo "Installing $package_name..."
	echo $PWD
	update_repository
	create_systemservice
	create_tomcat_user
	download_tomcat
	extract_tomcat
	set_permissions
	register_tomcat_service
	configure_firewall
	echo "Installed Succussfully"
	echo "You can verify the success by visiting http://localhost:8080"
	# exit 0
}

remove_server() {
	terminate_server
	echo "Removing $package_name..."
	sudo apt-get purge $package_name -y || { echo "Could not remove $package_name completely an error occured"; exit 1; }
	sudo apt-get remove $package_name -y
	sudo apt-get autoremove -y
	echo "Removed $package_name Successfully"
	# exit 0
}

start_server() {
	echo "Starting $package_name server..."
	sudo systemctl start tomcat || { echo "Could not start the $package_name Server"; exit 1; }
	echo "Server has been successfully started"
	echo "You can verify the success by visiting http://localhost:8080"
	# exit 0
}

terminate_server() {
	echo "Terminating $package_name server..."
	sudo systemctl stop tomcat || { echo "Could not stop the server some error occured"; exit 1; }
	echo "Server $package_name has been terminated Succussfully"
	# exit 0;
}

usage() {
	echo "Usage: $0 [-i or -r or -s or -t]"; exit 1;
}

while getopts ":irst" o
do	case $o in
	i)	install_server;;
	r)	remove_server;;
	s)	start_server;;
	t)	terminate_server;;
	*)	usage;;
	esac
done
shift $((OPTIND-1))
