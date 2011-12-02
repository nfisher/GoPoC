import 'classes/*'

node basenode {
	include unzip
	include git
	include jdk
}

node 'go01.local' inherits basenode {
	include goserver
	class { iptables: tcp_ports => [8153,8154] }
}

node 'builder01.local' inherits basenode {
	include rubyrake
	include rubyzip
	include rubybundler
	class { nginx: default_path => '/var/lib/go-agent/pipelines/Dev.PoC' }
	class { goagent: go_server => '10.0.0.2' }
	class { iptables: tcp_ports => [80] }
}

node 'app01.local' inherits basenode {
	class { nginx: default_path => '/var/lib/go-agent/pipelines/SysTest.PoC' }
	class { goagent: go_server => '10.0.0.2' }
	class { iptables: tcp_ports => [80] }
}

node 'ntf01.local' inherits basenode {
	class { nginx: default_path => '/var/lib/go-agent/pipelines/NTF.PoC' }
	class { goagent: go_server => '10.100.3.144' }
	class { iptables: tcp_ports => [80] }
}

node 'prod01.local' inherits basenode {
	class { nginx: default_path => '/var/lib/go-agent/pipelines/NTF.PoC' }
	class { goagent: go_server => '10.100.3.144' }
	class { iptables: tcp_ports => [80] }
}

