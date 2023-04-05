# == Class mirror_repos::config
#
# This class is called from mirror_repos
#
class mirror_repos::config {
  #just replicate yum.repos.d
  file { [ $mirror_repos::config_dir, $mirror_repos::repos_dir ]:
    ensure => directory,
  }
  #create a dir for each OS and then a file for each repo under that OS
  $mirror_repos::repos.each |String $os_name , $repos_os | {
    $os = regsubst($os_name, '[-]', '_', 'G')
    file {"${mirror_repos::config_dir}/${os}.conf":
      ensure  => 'file',
      mode    => '0644',
      content => epp('mirror_repos/repo.conf.epp',{
          os             => $os,
          repos_os       => $repos_os,
          proxy          => $mirror_repos::proxy,
          proxy_username => $mirror_repos::proxy_username,
          proxy_password => $mirror_repos::proxy_password,
      }),
    }
  }
  $oses = keys($mirror_repos::repos)
  $createrepo_additional_options = $mirror_repos::createrepo_options.join(' ')
  $download_metadata_option = $mirror_repos::download_metadata ? {
    true  => '--download-metadata',
    false => '',
  }
  $delete_old_option = $mirror_repos::delete_old ? {
    true  => '--delete',
    false => '',
  }
  #copy file to update repos to localhost
  file { '/usr/sbin/update-repos':
    ensure  => file,
    mode    => '0755',
    content => template('mirror_repos/update-repos.sh.erb'),
  }

  #If legacy cron job (/etc/cron.d) is preferred
  if $mirror_repos::legacy_cron {
    #run cron every night to update repos
    cron::job { 'update-repos':
      command => '/usr/sbin/update-repos',
      user    => 'root',
      require => File['/usr/sbin/update-repos'],
      minute  => $mirror_repos::cron_minute,
      hour    => $mirror_repos::cron_hour,
      date    => $mirror_repos::cron_date,
      month   => $mirror_repos::cron_month,
      weekday => $mirror_repos::cron_weekday,
    }

    # disable crontab job
    cron { 'update-repos':
      ensure  => absent,
      command => '/usr/sbin/update-repos',
      user    => 'root',
    }
  } else {
    cron { 'update-repos':
      command => '/usr/sbin/update-repos',
      user    => 'root',
      hour    => $mirror_repos::cron_hour,
      minute  => $mirror_repos::cron_minute,
      date    => $mirror_repos::cron_date,
      month   => $mirror_repos::cron_month,
      weekday => $mirror_repos::cron_weekday,
      require => File['/usr/sbin/update-repos'],
    }
  }
}
