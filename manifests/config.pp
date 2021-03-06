# == Class carbon::config
#
# This class is called from carbon
#
class carbon::config {
  File {
    mode   => '0644',
    notify => Service[$carbon::cache_service_name],
  }

  file {
    '/etc/carbon/aggregation-rules.conf':
      content => template('carbon/aggregation-rules.conf.erb');
    '/etc/carbon/storage-schemas.conf':
      content => template('carbon/storage-schemas.conf.erb');
    '/etc/carbon/storage-aggregation.conf':
      content => template('carbon/storage-aggregation.conf.erb');
  }
}
