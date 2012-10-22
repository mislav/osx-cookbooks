include_recipe "homebrew"

package "elasticsearch"

if node[:elasticsearch][:launchd]
  launch_service "org.elasticsearch" do
    path "#{ENV['HOME']}/Library/LaunchAgents/org.elasticsearch.plist"
    template_variables :prefix => node[:homebrew][:prefix],
      :user => node[:launch][:user]
  end
end
