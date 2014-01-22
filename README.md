# cron

Puppet module for cron.

## Example usage

Include with default parameters:
```puppet
include cron
```

Include with the singleton pattern:
```puppet
class { '::cron': }
```

Log both start and end of cronjobs
```puppet
class { '::cron':
  $extra_opts => '-L 2'
}

### Cron Jobs

Cronjobs are placed in /etc/cron.d. If you want cronjobs to be removed
automatically when they are removed from a manifest, instead of having
to 'ensure => absent', specify purge_dot_d => true when instantiating
the cron class

```puppet
class { '::cron':
  $purge_dot_d => true,
}
```

*Please note that this is destructive to existing unmanaged cronjobs in
/etc/cron.d!*

Example cronjob
```puppet
cron::job { 'disk usage':
  command => 'df -h',
  minute => '0',
  hour => '2',
  environment => [ 'MAILTO=admin@example.com' ]
  comment => "Send disk usage stats every hour"
}
```

## License

See [LICENSE](LICENSE) file.
