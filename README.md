# mirror_repos

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with mirror_repos](#setup)
    * [Beginning with mirror_repos](#beginning-with-mirror_repos)
3. [Usage - Configuration options and additional functionality](#examples)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

`puppetlabs-apache` module if you want to manage vhost within this module.
apache module create a http proxy with fqdn of the hostname.

This module copy all available rpms from given repo_source using reposync and
then create repository using createrepo from all rpms.

## Setup
`include ::mirror_repos`

Repo configuration should be a Hash in following format
`mirror_repos::repos:` must be followed by `OS-ARCH` and then
name of the repo and configuration of repo

### Beginning with mirror_repos

Add the following in your class
`include ::mirror_repos`

This module copy a bash script `update-repos` to /usr/sbin.
This script runs every night to sync remote repos.
This script has many options, to know more do `/usr/sbin/update-repos -h`.

#### Examples

#####

It is highly recommended to define repos in Hiera.
```
mirror_repos::config_dir: '/etc/repos'
mirror_repos::repos_dir: '/n/repos'
mirror_repos::repos:
  centos7-x86_64:
    base:
      baseurl: 'http://mirrors.tripadvisor.com/centos/7/os/x86_64/'
      gpgkey: 'http://mirrors.tripadvisor.com/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7'
      enabled: 1
  centos6-x86_64:
    base:
      baseurl: 'http://mirror.centos.org/centos-6/6/os/x86_64/'
      enabled: 0
```

## Reference

#### Parameters

The following parameters are available in the `mirror_repos` class.

##### `packages`

Data type: `Array`



Default value: $mirror_repos::params::packages

##### `repos`

Data type: `Hash`



Default value: $mirror_repos::params::repos

##### `vhosts`

Data type: `Hash`


Default value: $mirror_repos::params::vhosts

##### `config_dir`

Data type: `String`


Default value: $mirror_repos::params::config_dir

##### `repos_dir`

Data type: `String`


Default value: $mirror_repos::params::repos_dir

##### `manage_vhost`

Data type: `Boolean`


Default value: $mirror_repos::params::manage_vhost


### mirror_repos::apache

The mirror_repos::apache class.

### mirror_repos::config

== Class mirror_repos::config

This class is called from mirror_repos

### mirror_repos::install

The mirror_repos::install class.

### mirror_repos::params

The mirror_repos::params class.

## Limitations

This Module is tested on RedHat7 and CentOS7.

## Development

For contributing Fork this module and open PR.

Authors
-------

Bhanu Prasad G <gangurubhanu@gmail.com>

Copyright
---------
Copyright [2018] [Bhanu Prasad G]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
