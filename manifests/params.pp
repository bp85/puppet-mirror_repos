#mirror_repos parameters
class mirror_repos::params {
  case $facts['os']['family'] {
    'RedHat': {
              $packages     = ['createrepo', 'yum-utils']
              $manage_vhost = true
              $vhosts       = {}
              $config_dir   = '/etc/mirror.repos.d'
              $repos_dir    = '/repos'
              $repos        = {}
    }
    default: {
              fail("${facts['os']['name']} not supported")
    }
  }
}
