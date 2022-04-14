class firewallcustom (
  Enum['present','absent','latest','installed'] $package_ensure = 'installed',
  String                                        $package        = 'firewalld',
  String                                        $service        = 'firewalld',
  String                                        $service_ensure = 'running',
  Boolean                                       $service_enable = true,
  Optional[String]                              $default_port_protocol = undef,
  Hash                                          $ports          = {},

) {
  include firewallcustom::bounce

  package { $package:
    ensure => $package_ensure,
    notify => Service['firewalld'],
  }

  Exec {
    path => '/usr/bin:/bin',
  }

  service { $service:
    ensure => $service_ensure,
    enable => $service_enable,
  }

  Firewalld_port {
    protocol  => $default_port_protocol,
  }

  $ports.each |String $key, Hash $attrs| {
    firewalld_port { $key:
      *       => $attrs,
    }
  }

  Firewalld_port <||> ~> Class['firewallcustom::bounce']
}
