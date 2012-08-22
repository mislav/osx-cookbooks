default.emacs[:user] = ENV['SUDO_USER'] || ENV['USER']
default.emacs[:git]  = "https://github.com/josh/emacs.d.git"
default.emacs[:path] = "#{ENV['HOME']}/.emacs.d"
