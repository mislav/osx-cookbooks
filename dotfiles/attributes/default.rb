default.dotfiles[:user] = ENV['SUDO_USER'] || ENV['USER']
default.dotfiles[:home] = ENV['HOME']
default.dotfiles[:git]  = "https://github.com/josh/dotfiles.git"
default.dotfiles[:path] = "#{ENV['HOME']}/.dotfiles"
