# Main Class. Create parameters and includes all othre classes 
#
# @summary
# Sets up and maintains Teleport (goteleport.com)
#
# @example
# include teleport
#
# @param node_type
#   Specifies the server Type: auth, proxy, node, all
#   Defaults to type 'node'
#
# @param config
#   Specifies a file for Teleport's configuration file. Default value: '/etc/teleport.yaml'
#   include teleport
# 
# @param package_ensure
#   Whether to install the Teleport package, and what version to install. Values: 'present', 'latest', or a specific version number.
#   Default value: 'present'.
#
# @param package_name
#   Specifies Teleport  package to manage. Default value: ['teleport'] (you may set to teleport-ent, for enterprise version).
#
# @param service_name
#   The Teleport service to manage. Default value: varies by operating system.
#
# @param service_ensure
#   Whether Teleport service should be running. Default value: 'running'.
#
# @param service_enable
#   Whether to enable Teleport service at boot. Default value: true.
#
# @param service_hasstatus
#   Whether service has a functional status command. Default value: true.
#
# @param service_hasrestart
#   Whether service has a restart command. Default value: true.
#
# @param config_template
#   Specifies an absolute or relative file path to an ERB template for the config file.
#   Default value: 'teleport/teleport.yaml.erb'. 
#
class teleport(
  Enum['auth', 'proxy', 'node', 'all'] $node_type,
  Stdlib::Absolutepath $config,
  String $package_ensure,
  Array[String] $package_name,
  String $service_name,
  Bool $service_enable,
  Bool $service_hasstatus,
  Bool $service_hasrestart,
  String $config_template,
  Enum['running', 'stopped'] $service_ensure,
) {

  contain teleport::install
  contain teleport::config
  contain teleport::service

  Class['::teleport::install']
  -> Class['::teleport::config']
  ~> Class['::teleport::service']
}
