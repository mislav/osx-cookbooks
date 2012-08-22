defaults "com.apple.Terminal", "Default Window Settings" do
  value node[:apple][:terminal][:default_settings]
end

settings = node[:apple][:terminal][:settings]

if default_setting = node[:apple][:terminal][:default_settings]
  settings ||= []
  settings << default_setting if !settings.include?(default_setting)
end

if settings
  installed_settings = `defaults read com.apple.Terminal "Window Settings"`
  for name in settings
    unless installed_settings.match(name)
      target = "#{Chef::Config[:file_cache_path]}/#{name}.terminal"
      cookbook_file target do
        owner node[:defaults][:user]
        group "staff"
      end
      execute "install #{name}" do
        command "open #{target.inspect}"
      end
    end
  end
end

defaults "com.apple.Terminal", "Startup Window Settings" do
  value node[:apple][:terminal][:default_settings]
end
