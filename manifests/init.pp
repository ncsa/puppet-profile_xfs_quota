# @summary
#   Creates a xfs_quota bash script in /etc/telegraf/scripts, and a conf file to run it
#
# @param enable
#   Enables the xfs quota checks
#
# @param sudo_cfg
#   Configures proper sudo access for telegraf to run the script
# 
# @param volume_path
#   Specifies the path of the xfs volume
#
# @example
#   include profile_xfs_quota
class profile_xfs_quota (
  Boolean $enable,
  String $sudo_cfg,
  String $volume_path,
) {
  if ($enable) {
    $ensure_parm = 'present'
  } else {
    $ensure_parm = 'absent'
  }

  # Script file
  file { '/etc/telegraf/scripts/xfs_quota.sh':
    ensure  => $ensure_parm,
    content => epp('profile_xfs_quota/xfs_quota.epp'),
    mode    => '0750',
    owner   => 'root',
    group   => 'telegraf',
  }

  # Telegraf conf file
  file { '/etc/telegraf/telegraf.d/xfs_quota.conf':
    ensure  => $ensure_parm,
    content => file("${module_name}/xfs_quota.conf"),
    mode    => '0640',
    owner   => 'root',
    group   => 'telegraf',
    notify  => Service['telegraf'],
    require => File['/etc/telegraf/scripts/xfs_quota.sh'],
  }

  # Sudo config for this profile
  sudo::conf { 'telegraf_xfs_quota_check':
    ensure   => $ensure_parm,
    priority => 10,
    content  => $sudo_cfg,
  }
}
