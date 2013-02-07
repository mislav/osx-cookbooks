git node[:dotfiles][:path] do
  repository node[:dotfiles][:git]
  action :sync
  user node[:dotfiles][:user]
end

Dir["#{node[:dotfiles][:path]}/*"].each do |file|
  source, file = file, File.basename(file)
  target = "#{node[:dotfiles][:home]}/.#{file}"

  if !File.symlink?(target)
    if File.directory?(target)
      directory target do
        action :delete
        recursive true
      end
    elsif File.file?(target)
      file target do
        action :delete
      end
    end
  end

  link target do
    to source
    owner node[:dotfiles][:user]
    group "staff"
    only_if { File.exist?(source) }
  end
end

include_recipe "homebrew"
include_recipe "emacs"
include_recipe "git"
include_recipe "rbenv"

package "direnv"
package "rlwrap"
package "wget"
