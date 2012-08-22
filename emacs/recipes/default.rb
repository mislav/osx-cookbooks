include_recipe "homebrew"

package "emacs"

git node[:emacs][:path] do
  repository node[:emacs][:git]
  action :sync
  user node[:emacs][:user]
end

package "ack"

package "aspell" do
  options "--lang=en"
end
