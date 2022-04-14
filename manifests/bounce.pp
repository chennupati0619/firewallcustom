class firewallcustom::bounce {

    exec { 'firewallcustom::bounce':
    path        => '/usr/bin:/bin',
    command     => 'firewall-cmd --reload',
    onlyif      => 'firewall-cmd --state',
    refreshonly => true,
  }
}
