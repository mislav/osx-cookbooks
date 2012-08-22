execute "ensure ssh private key exist" do
  command "sh -c 'exit 1'"
  creates "#{node[:ssh][:path]}/id_rsa"
end

execute "ensure ssh public key exist" do
  command "sh -c 'exit 1'"
  creates "#{node[:ssh][:path]}/id_rsa.pub"
end

file "#{node[:ssh][:path]}/id_rsa" do
  mode '0600'
end
