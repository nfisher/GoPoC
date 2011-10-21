import "classes/*"

node default {
	include jdk
}

node go01.local {
	include go_server
}

node app01.local {
	include go_agent
}

