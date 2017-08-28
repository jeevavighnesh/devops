#/bin/bash

# This is a script to install and startup an apache server
# at port 80

ver=2
package_name=$(echo "apache"$ver)

install_server() {
	echo "Installing $package_name..."
	sudo apt-get update
	sudo apt-get install $package_name -y || { echo "Could not install $package_name Server"; exit 1; }
	echo "Installed Succussfully"
	echo "You can see your success message at http://localhost:80"
	# exit 0
}

start_server() {
	echo "Starting $package_name server..."
	sudo service $(echo $package_name) start || { echo "Could not start the $package_name Server"; exit 1; }
	echo "Server has been successfully started"
	echo "You can see your success message at http://localhost:80"
	# exit 0
}

terminate_server() {
	echo "Terminating $package_name server..."
	sudo service $package_name stop || { echo "Could not stop the server some error occured"; exit 1; }
	echo "Server $package_name has been terminated Succussfully"
	# exit 0;
}

remove_server() {
	terminate_server
	echo "Removing $package_name..."
	sudo apt-get purge $package_name $(echo $package_name"-utils") -y || { echo "Could not remove $package_name completely an error occured"; exit 1; }
	sudo apt-get autoremove -y
	echo "Removed $package_name Successfully"
	# exit 0
}

usage() {
	echo "Usage: $0 [-i or -r or -s or -t]"; exit 1;
}

for (( ; ; ))
do	
	getopts ":irst" o
	case $o in
	i)	install_server;exit 0;;
	r)	remove_server;exit 0;;
	s)	start_server;exit 0;;
	t)	terminate_server;exit 0;;
	*)	usage;;
	esac
done
shift $((OPTIND-1))
