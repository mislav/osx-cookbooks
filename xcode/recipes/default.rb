execute "ensure Xcode is installed" do
  command "sh -c 'exit 1'"
  creates "/Applications/Xcode.app"
end

execute "ensure Xcode license is accepted" do
  command "xcrun -find git"
  not_if "xcrun -find git"
end

execute "sudo xcode-select -switch #{node[:xcode][:path]}" do
  not_if { `xcode-select -print-path`.chomp == node[:xcode][:path] }
  user node[:xcode][:user]
end

execute "ensure Xcode llvm-gcc version is the same as Command Line Tools" do
  command "sh -c 'exit 1'"
  not_if { `llvm-gcc --version` == `xcrun llvm-gcc --version` }
end

execute "ensure Xcode clang version is the same as Command Line Tools" do
  command "sh -c 'exit 1'"
  not_if { `clang --version` == `xcrun clang --version` }
end
