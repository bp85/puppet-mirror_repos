# Class: mirror_repos
# ===========================
#
# Full description of class mirror_repos here.
#
# Parameters
# ----------
#
# * `mirror_repos::vhost`
# create apache vhost with this name. Default is FQDN
#
# Variables
# ----------
#
# * `mirror_repos::config_dir`
# Where to deploy the repo configuration files.
# Default is `/etc/mirror.repos.d`
#
# * `mirror_repos::repos_dir`
# Where to store the mirrorred repos
# Default is `/repos`
#
# * `mirror_repos::repos`
# repositories to mirror
# Default is empty
#
# Examples
# ####
# --------
#
# @example
#    class { 'mirror_repos':
#      config_dir => '/etc/repos_conf',
#    }
#
#
class mirror_repos (
    Array $packages       = $mirror_repos::params::packages,
    Hash $repos           = $mirror_repos::params::repos,
    Hash $vhosts          = $mirror_repos::params::vhosts,
    String $config_dir    = $mirror_repos::params::config_dir,
    String $repos_dir     = $mirror_repos::params::repos_dir,
    Boolean $manage_vhost = $mirror_repos::params::manage_vhost,
  ) inherits mirror_repos::params {

    class { '::mirror_repos::install': }
    -> class { '::mirror_repos::config': }
    -> class { '::mirror_repos::apache': }
}
