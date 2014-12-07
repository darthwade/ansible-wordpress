# Ansible Playbook: WordPress
[![Build Status](https://travis-ci.org/darthwade/ansible-wordpress.png)](https://travis-ci.org/darthwade/ansible-wordpress)
[![MIT License](http://img.shields.io/badge/license-MIT-003399.svg)](http://opensource.org/licenses/MIT)
[![Gittip](http://img.shields.io/gittip/darthwade.svg)](https://www.gittip.com/darthwade/)
[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=darthwade&url=https://github.com/darthwade/ansible-wordpress&title=Ansible Role: WordPress Apache&language=&tags=github&category=software) 

Ansible playbook for setting up WordPress, Apache, PHP + Zend OpCache, MySQL, Auto MySQL Backup, Memcached, Monit, Git, UFW.
Ansible role that installs and configures WordPress on Apache.

Features include:
- Installation of any WordPress version
- Configuration of wp-config.php
- Fetch random salts for wp-config.php (https://api.wordpress.org/secret-key/1.1/salt/)
- Configuration of Apache virtual host
- Creation of MySQL database and user
- Installation of monit system
- Configuring firewall

## Installation

Using `git`:
```shell 
$ git clone https://github.com/darthwade/ansible-wordpress.git
```

## Usage

Run machine locally:
  - http://localhost:4567 - WordPress
  - http://localhost:4568 - Monit
```shell 
$ vagrant up
```

Run production machine:
  - Update production inventory (./production)
```shell 
$ INVENTORY='production' REMOTE_USER='ubuntu' CONNECTION='smart' PLAYBOOK='site.yml' vagrant up
```

Default env arguments:
```shell
INVENTORY='stage'
PLAYBOOK='site.yml'
REMOTE_USER='vagrant'
CONNECTION='local'
```

## Requirements & Dependencies
- Vagrant 1.6.5 or higher
- VirtualBox

## Variables
Here is a list of all the default variables for this role, which are also available in `host_vars/example.com`.

```yaml 
# Timezone
timezone: UTC

# WordPress
wp_version: 4.0
wp_install_dir: '/var/sites/expamle.com'
wp_db_name: 'expamledb'
wp_db_user: 'expamleuser'
wp_db_password: 'expamle2014password'
wp_db_host: 'localhost'

wp_apache_hostname: 'expamle.com'
wp_apache_alias: 'www.expamle.com'
wp_apache_admin_email: 'admin@expamle.com'

# MySQL
mysql_port: 3306
# mysql_bind_address: 'localhost'
mysql_root_password: 'p_cd&u8bO1Ce_|O#|,&~oA}tDY!,$^!3wkmw*ZQ`6HTV'
mysql_databases:
  - name: '{{wp_db_name}}'
    encoding: 'utf8'
    collation: 'utf8_general_ci'
mysql_users:
  - name: '{{wp_db_user}}'
    host: '%'
    password: '{{wp_db_password}}'
    priv: '{{wp_db_name}}.*:ALL'

# Monit
monit_notify_email: 'admin@expamle.com'

monit_mailserver_host: 'localhost'
# monit_mailserver_port:
# monit_mailserver_username:
# monit_mailserver_password:
# monit_mailserver_encryption:
monit_mailserver_timeout: 60

monit_port: 3737
monit_address: 'expamle.com'
monit_allow: ['expamle.com', 'localhost']
monit_username: 'admin'
monit_password: 'expamle2014password'
```

## Testing
```shell 
$ git clone https://github.com/darthwade/ansible-wordpress.git
$ cd ansible-wordpress
$ vagrant up
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Licensed under the MIT License. See the LICENSE file for details.

Copyright (c) 2014 [Vadym Petrychenko](http://petrychenko.com/)