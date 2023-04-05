#mirror_repos parameters
class mirror_repos::params {
  case $::osfamily {
    'RedHat': {
              $packages           = ['createrepo', 'yum-utils']
              $manage_vhost       = true
              $vhosts             = {}
              $config_dir         = '/etc/mirror.repos.d'
              $repos_dir          = '/repos'
              $repos              = {}
              $createrepo_options = []
              $download_metadata  = false
              $delete_old         = false
              $legacy_cron        = false
              $cron_minute        = '0'
              $cron_hour          = '1'
              $cron_date          = '*'
              $cron_month         = '*'
              $cron_weekday       = '*'
    }
    default: {
              fail("${::operatingsystem} not supported")
    }
  }
}
