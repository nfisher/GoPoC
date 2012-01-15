class rabbitmq {
	package { 'rabbitmq-server':
		provider => yum,
		ensure => present,
	}

	exec { 'fetch-rabbit-stomp':
		path => "/usr/bin",
		cwd => '/usr/lib/rabbitmq/lib/rabbitmq_server-2.6.1/plugins',
		command => 'curl -o rabbit_stomp-2.6.1.ez http://www.rabbitmq.com/releases/plugins/v2.6.1/rabbitmq_stomp-2.6.1.ez',
		unless => '[ -f /usr/lib/rabbitmq/lib/rabbitmq_server-2.6.1/plugins/rabbit_stomp-2.6.1.ez ]',
	}

	exec { 'fetch-rabbit-amqp':
		path => "/usr/bin",
		cwd => '/usr/lib/rabbitmq/lib/rabbitmq_server-2.6.1/plugins',
		command => 'curl -o amqp_client-2.6.1.ez http://www.rabbitmq.com/releases/plugins/v2.6.1/rabbitmq_stomp-2.6.1.ez',
		unless => '[ -f /usr/lib/rabbitmq/lib/rabbitmq_server-2.6.1/plugins/amqp_client-2.6.1.ez ]',
	}

	file { '/etc/rabbitmq/rabbitmq.config':
		ensure => 'file',
		content => '[ {rabbitmq_stomp, [{tcp_listeners, [6163]}]} ].',
	}
}
