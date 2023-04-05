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
# * `mirror_repos::createrepo_options`
# Options to add to the createrepo command in `update-repo` bash script.
# Must be an array containing options, for example
#   $createrepo_options = [ '--local-sqlite' ]
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
    Array $packages            = $mirror_repos::params::packages,
    Hash $repos                = $mirror_repos::params::repos,
    Hash $vhosts               = $mirror_repos::params::vhosts,
    String $config_dir         = $mirror_repos::params::config_dir,
    String $repos_dir          = $mirror_repos::params::repos_dir,
    Boolean $manage_vhost      = $mirror_repos::params::manage_vhost,
    Array $createrepo_options  = $mirror_repos::params::createrepo_options,
    Boolean $download_metadata = $mirror_repos::params::download_metadata,
    Boolean $delete_old        = $mirror_repos::params::delete_old,
    Boolean $legacy_cron       = $mirror_repos::params::legacy_cron,
    String $cron_minute        = $mirror_repos::params::cron_minute,
    String $cron_hour          = $mirror_repos::params::cron_hour,
    String $cron_date          = $mirror_repos::params::cron_date,
    String $cron_month         = $mirror_repos::params::cron_month,
    String $cron_weekday       = $mirror_repos::params::cron_weekday,
    Optional[Stdlib::HTTPUrl] $proxy                            = undef,
    Optional[String] $proxy_username                            = undef,
    Optional[Variant[String,Sensitive[String]]] $proxy_password = undef,
  ) inherits mirror_repos::params {

    class { '::mirror_repos::install': }
    -> class { '::mirror_repos::config': }
    -> class { '::mirror_repos::apache': }
}
