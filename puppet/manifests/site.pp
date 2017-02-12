node /^pgsql-\d+\.local$/ {
    class { 'postgresql::globals': }->
    class { 'postgresql::server': }->
    exec { 'copy keys':
      command => '/bin/cp -r /vagrant/ssh /var/lib/postgresql/.ssh && /bin/chown -R postgres.postgres /var/lib/postgresql/.ssh',
      onlyif => '/usr/bin/test ! -d /var/lib/postgresql/.ssh',
    }

    create_resources('::postgresql::server::db', hiera_hash('postgresql::server::db', {}))
    create_resources('::postgresql::server::pg_hba_rule', hiera_hash('postgresql::server::pg_hba_rule', {}))
    create_resources('::postgresql::server::config_entry', hiera_hash('postgresql::server::config_entry', {}))

}

node /^barman.local$/ {
    class { 'postgresql::globals': }->
    class { '::barman': } ->
    exec { 'copy keys':
      command => '/bin/cp -r /vagrant/ssh /var/lib/barman/.ssh && /bin/chown -R barman.barman /var/lib/barman/.ssh',
      onlyif => '/usr/bin/test ! -d /var/lib/barman/.ssh',
    }

    create_resources('::barman::server', hiera_hash('barman::server', {}))
}
