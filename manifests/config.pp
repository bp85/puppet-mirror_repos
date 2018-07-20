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
      content => template('mirror_repos/repo.conf.erb'),
    }
  }
  $oses = keys($mirror_repos::repos)
  #copy file to update repos to localhost
  file { '/usr/sbin/update-repos':
    ensure  => file,
    mode    => '0755',
    content => template('mirror_repos/update-repos.sh.erb'),
  }
  #run cron every night to update repos
  cron { 'update-repos':
    command => '/usr/sbin/update-repos',
    user    => 'root',
    hour    => 1,
    minute  => 0,
    require => File['/usr/sbin/update-repos'],
  }
}
