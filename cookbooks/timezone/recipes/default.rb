bash 'change timezone to CDT' do
  code <<-EOH
  echo "America/Chicago" | sudo tee /etc/timezone
  sudo dpkg-reconfigure --frontend noninteractive tzdata
  EOH
  only_if do
    File.read('/etc/timezone').chomp == "UTC"
  end
end
