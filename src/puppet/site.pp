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
	include rubyrake
	include rubyzip
	include rubybundler
	class{ goagent: go_server => "10.0.0.2" }
}

node 'app01.local' inherits basenode {
	class{ goagent: go_server => "10.0.0.2" }
}

