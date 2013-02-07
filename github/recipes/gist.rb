include_recipe "gcc"
include_recipe "git"
include_recipe "icu4c"
include_recipe "memcached"
include_recipe "mysql"
include_recipe "node"
include_recipe "phantomjs"
include_recipe "pow"
include_recipe "python"
include_recipe "qt"
include_recipe "rbenv"
include_recipe "redis"

# Only define directory resource once
begin
  run_context.resource_collection.lookup("rbenv_version[rbenv version 1.9.3-p194]")
rescue Chef::Exceptions::ResourceNotFound => e
  rbenv_version "1.9.3-p194"
end
