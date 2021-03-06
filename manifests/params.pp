# pe_metrics_dashboard::params
#
# A description of what this class does
#
# @summary Default parameters for the installation
#
# @api private
class pe_metrics_dashboard::params {

  # Default Installation parameters
  $add_dashboard_examples =  false
  $manage_repos           =  true
  $overwrite_dashboards   =  true
  $use_dashboard_ssl      =  false
  $dashboard_cert_file    = "/etc/grafana/${clientcert}_cert.pem"
  $dashboard_cert_key     = "/etc/grafana/${clientcert}_key.pem"
  $influxdb_database_name =  ['telegraf']
  $grafana_version        =  '4.5.2'
  $grafana_http_port      =  3000
  $influx_db_password     =  'puppet'
  $grafana_password       =  'admin'
  $consume_graphite       =  false
  # Influxdb TICK stack
  $enable_telegraf        =  true
  $enable_kapacitor       =  false
  $enable_chronograf      =  false
  # telegraf config
  $configure_telegraf     =  true
  $master_list            =  [$::settings::certname]
  $puppetdb_list          =  [$::settings::certname]

  $overwrite_dashboards_file = '/opt/puppetlabs/puppet/cache/state/overwrite_dashboards_disabled'

  case $::osfamily {

    'RedHat': {
      $influx_db_service_name = 'influxdb'
    }
    'Debian': {
      $influx_db_service_name = 'influxd'
    }
    default: {
      fail("${::osfamily} installation not supported")
    }
  }

}
