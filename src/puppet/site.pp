import "classes/*"

node basenode {
	include unzip
	include git
	include jdk
}

node 'go01.local' inherits basenode {
	include go_server
	class { iptables:
		conf_file => "goserver.iptables"
	}
}

node 'builder01.local' inherits basenode {
	include go_agent
}

node 'app01.local' inherits basenode {
	include go_agent
}

