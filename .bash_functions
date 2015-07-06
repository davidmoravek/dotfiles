# Password generator
genpasswd() {
	local l=$1
	[ "$l" == "" ] && l=20
	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

createTmpDir () {
	local TMZ=$(date +%s)
	mkdir "tmp_$TMZ"
	cd "tmp_$TMZ"
}

tmpclone () {
	createTmpDir
	git clone $1
	cd `ls`
}

httpshare () {
	echo -e "Starting simple HTTP server. Listening on:\n"
	for ip in $(ifconfig | grep "inet " | grep -v "127.0" | awk '{ print $2 }'); do echo -e "\thttp://${ip}:8000"; done
	echo ""
	python -m SimpleHTTPServer 8000 2>/dev/null
}

reverseAdiblePing () {
	local ip=$1
	if [ -z "$ip" ]; then
		echo "Usage reverseAdiblePing <ip>"
		return 1
	fi
	while true; do ping -t 1 -c 1 -W 20 "$ip"; if [ $? != 0 ] ;then echo -en "\a"; fi;sleep 1;done
}
