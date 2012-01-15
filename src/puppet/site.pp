import 'classes/*'

stage { 'epel': before => Stage['main'] }

node basenode {
	class { 'epel': stage => 'epel' }
	include unzip
	include git
}

node javanode inherits basenode {
	include jdk
}

node 'go01.local' inherits javanode {
	include goserver
	class { iptables: tcp_ports => [8153,8154] }
}

node 'builder01.local' inherits javanode {
	include rubyrake
	include rubyzip
	include rubybundler
	class { nginx: default_path => '/var/lib/go-agent/pipelines/Dev.PoC' }
	class { goagent: go_server => '10.0.0.2' }
	class { iptables: tcp_ports => [80] }
}

node 'app01.local' inherits javanode {
	class { nginx: default_path => '/var/lib/go-agent/pipelines/SysTest.PoC' }
	class { goagent: go_server => '10.0.0.2' }
	class { iptables: tcp_ports => [80] }
}

node 'ntf01.local' inherits javanode {
	class { nginx: default_path => '/var/lib/go-agent/pipelines/NTF.PoC' }
	class { goagent: go_server => '10.100.3.144' }
	class { iptables: tcp_ports => [80] }
}

node 'prod01.local' inherits javanode {
	class { nginx: default_path => '/var/lib/go-agent/pipelines/Prod.PoC' }
	class { goagent: go_server => '10.100.3.144' }
	class { iptables: tcp_ports => [80] }
}

node 'master01.local' inherits javanode {
	include rabbitmq
	include mcollective-client
	include mcollective
	class { iptables: tcp_ports => [6163] }
}
