include_recipe "homebrew"
include_recipe "gcc"

package "rbenv"
package "ruby-build"

node[:rbenv][:versions].each do |version|
  rbenv_version version
end

if version = node[:rbenv][:global]
  target = "#{node[:rbenv][:root]}/version"
  execute "rbenv global #{version}" do
    command "echo #{version} > #{target}"
    user node[:rbenv][:user]
    not_if do
      File.exist?(target) && File.read(target).chomp == version
    end
  end
end
