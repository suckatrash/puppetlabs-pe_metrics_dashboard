Facter.add(:overwrite_dashboards_disabled) do
  confine :kernel => 'Linux'
  disabled_file = '/opt/puppetlabs/puppet/cache/state/overwrite_dashboards_disabled'
  setcode do
      File.exists?(disabled_file)
  end
end
