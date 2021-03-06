# == Class cron::config
#
# This class is called from cron
#
class cron::config {

  File {
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  $lsbnames = $::cron::lsbnames
  $extra_opts = $::cron::extra_opts

  file { $::cron::override_file:
    content => template('cron/upstart/override.erb')
  }

  file { $::cron::dot_dir:
    ensure  => directory,
    recurse => true,
    purge   => $::cron::purge_dot_dir,
  }

  # Keep placeholder file so dpkg doesn't remove the directory if purge_dot_dir
  # is true.
  file { "${::cron::dot_dir}/.placeholder":
  }

  # Resource ordering
  File[$::cron::dot_dir] -> File["${::cron::dot_dir}/.placeholder"]
}
