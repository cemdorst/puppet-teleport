# @summary
# This Class sets up and configures Teleport (goteleport.com) services.
#
# @api private
#
class teleport::service {
  service { 'teleport':
    ensure     => $teleport::service_ensure,
    name       => $ntp::service_name,
    enable     => $teleport::service_enable,
    hasstatus  => $ntp::service_hasstatus,
    hasrestart => $ntp::service_hasrestart,
  }
}
