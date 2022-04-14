# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include firewallcustom::post
class firewallcustom::post {
     firewall { '999 drop all':
       proto  => 'all',
       action => 'drop',
       before => undef,
     }
   }
