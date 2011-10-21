import "classes/*"

node default {
	include jdk
}

node go.local {
	include go_server
}

node app.local {
	include go_agent
}

