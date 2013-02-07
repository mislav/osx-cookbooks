include_recipe "elasticsearch"
include_recipe "erlang"
include_recipe "gcc"
include_recipe "git"
include_recipe "homebrew"
include_recipe "icu4c"
include_recipe "memcached"
include_recipe "mysql"
include_recipe "node"
include_recipe "openvpn"
include_recipe "pow"
include_recipe "python"
include_recipe "rbenv"
include_recipe "redis"
include_recipe "solr"

package "gpgme"

begin
  run_context.resource_collection.lookup("rbenv_version[rbenv version 1.8.7-p358]")
rescue Chef::Exceptions::ResourceNotFound => e
  rbenv_version "1.8.7-p358"
end
