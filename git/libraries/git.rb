require 'chef/provider/git'

class Chef::Provider::Git < Chef::Provider
  # Patch git resource to checkout to master instead of deploy branch
  def checkout
    sha_ref = target_revision
    shell_out!("git checkout -B master #{sha_ref}", run_options(:cwd => @new_resource.destination))
  end
end
