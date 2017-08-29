#/bin/bash

# This is a script to install and startup an tomcat server
# at port 8080

ver=8
package_name=$(echo "tomcat"$ver)

update_repository() {
	sudo apt-get update || { echo "Error while updating repository"; return; }
}

install_server() {
	echo "Installing $package_name..."
	update_repository
	sudo apt-get install $(echo $package_name) -y || { echo "Could not install $package_name Server"; exit 1; }
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
	sudo service $(echo $package_name) start || { echo "Could not start the $package_name Server"; exit 1; }
	echo "Server has been successfully started"
	echo "You can verify the success by visiting http://localhost:8080"
	# exit 0
}

terminate_server() {
	echo "Terminating $package_name server..."
	sudo service $package_name stop || { echo "Could not stop the server some error occured"; exit 1; }
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
