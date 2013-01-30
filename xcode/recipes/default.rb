execute "ensure Xcode is installed" do
  command "sh -c 'exit 1'"
  creates "/Applications/Xcode.app"
end

execute "sudo xcode-select -switch #{node[:xcode][:path]}" do
  not_if { `xcode-select -print-path`.chomp == node[:xcode][:path] }
  user node[:xcode][:user]
end

execute "ensure Xcode license is accepted" do
  command "xcrun -find git"
  not_if "xcrun -find git"
end

unless File.exist?("/usr/bin/llvm-gcc")
  cli_dmg = "command_line_tools_os_s_x_mountain_lion_for_xcode_january_2013.dmg"
  root    = Chef::Config[:file_cache_path]

  remote_file "#{root}/#{cli_dmg}" do
    source "http://devimages.apple.com/downloads/xcode/#{cli_dmg}"
    action :create_if_missing
  end

  archive "#{root}/#{cli_dmg}" do
    path root
  end

  execute "sudo installer -pkg '#{root}/Command Line Tools (Mountain Lion).mpkg' -target /" do
    user node[:homebrew][:user]
    not_if "which llvm-gcc"
  end
end

execute "ensure Xcode Command Line Tools are installed" do
  command "which llvm-gcc"
  not_if "which llvm-gcc"
end

execute "ensure Xcode llvm-gcc version is the same as Command Line Tools" do
  command "sh -c 'exit 1'"
  not_if { `llvm-gcc --version` == `xcrun llvm-gcc --version` }
end

execute "ensure Xcode clang version is the same as Command Line Tools" do
  command "sh -c 'exit 1'"
  not_if { `clang --version` == `xcrun clang --version` }
end
