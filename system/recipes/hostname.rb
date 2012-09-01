if name = node[:system][:name]
  execute "sudo scutil --set ComputerName #{name.inspect}" do
    not_if { `scutil --get ComputerName`.chomp == name }
  end

  execute "sudo scutil --set LocalHostName #{name.inspect}" do
    not_if { `scutil --get LocalHostName`.chomp == name }
  end
end
