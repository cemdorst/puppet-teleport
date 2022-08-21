# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @api private
#
class teleport::config {

  case $teleport::node_type {
    all: {
      $config_template = 'teleport/teleport_all.yaml.erb'
    }
    auth: {
      $config_template = 'teleport/teleport_auth.yaml.erb'
    }
    proxy: {
      $config_template = 'teleport/teleport_proxy.yaml.erb'
    }
    default: {
      $config_template = 'teleport/teleport_node.yaml.erb'
    }
  }

  file { $teleport::config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0640',
    content => template($teleport::config_template),
  }
}
