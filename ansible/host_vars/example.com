---
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
    host: "%"
    password: '{{wp_db_password}}'
    priv: '{{wp_db_name}}.*:ALL'

# Monit
monit_notify_email: "admin@expamle.com"

monit_mailserver_host: "localhost"
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