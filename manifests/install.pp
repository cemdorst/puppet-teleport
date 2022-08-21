# @summary
# This Class installs Teleport (goteleport.com) software
#
# @api private
#
class teleport::install {
  package { $teleport::package_name:
    ensure => $teleport::package_ensure,
  }
}
