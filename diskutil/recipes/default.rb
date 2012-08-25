execute "Repair Disk Permissions" do
  command "diskutil repairPermissions /"
  only_if { `diskutil verifyPermissions /`.grep(/Permissions differ/).any? }
end
