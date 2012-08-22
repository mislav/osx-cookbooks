node[:git][:repositories].each do |dir, url|
  git dir do
    repository url
    action :sync
    user node[:git][:user]
  end
end
