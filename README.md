# firewallcustom

Welcome custom FIREWALL module. This is aiming towards managing system firewall rules by puppet

The README template below provides a starting point with details about what
information to include in your README.


## Table of Contents

1. [Description](#description)
2. [Pre-requisites](#pre-requisites)
3. [ResourceTypes](#resource-types)

## Description

Starting point to manage your Linux firewall.

## Pre-requisites

1. Install Stdlib module version less than 5

```puppet module install puppet-firewalld --version 4.4.0```

2. Install this module only on systemd based systems where one want to manage firewall using firewall-cmd command. 

## Resource-types

This module supports a number of resource types:

* [firewalld_port](#firewalld-ports)

### Firewalld Ports

Firewalld ports can be managed with the `firewalld_port` resource type.

firewalld_port will `autorequire` the firewalld_zone specified in the `zone`
parameter so there is no need to add dependencies for this

_Example_:

```puppet
  firewalld_port { 'Open TCP port 30000-32767 for Kubernetes':
    ensure   => present,
    port     => 30000-32767,
    protocol => 'tcp',
  }
```

_Example in Hiera_:

```yaml
firewallcustom::ports:
  'Open TCP port 30000-32767 for Kubernetes':
    ensure: present
    port: 30000-32767
    protocol: 'tcp'
```
