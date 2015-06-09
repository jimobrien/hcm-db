class { 'postgresql::server':
  locale                  => 'en_US.UTF-8',
  ip_mask_allow_all_users => '0.0.0.0/0',
  listen_addresses        => '*',
  ipv4acls                => ['host all all all md5'],
  postgres_password       => 'postgres',
}->
postgresql::server::role { 'vagrant':
  createdb      => true,
  login         => true,
  password_hash => postgresql_password("vagrant", "vagrant"),
}->
postgresql::server::db { 'hcm':
  user     => 'vagrant',
  password => postgresql_password("vagrant", "vagrant")
}
