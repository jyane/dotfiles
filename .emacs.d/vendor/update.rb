# -*- coding: utf-8 -*-
# vendorに入っているのを全部アップデート
# ここからぱくった
# http://github.com/rmm5t/dotfiles/blob/master/emacs.d/vendor/upgrade.rb

Dir["*/"].each do |dir|
  puts "Updating #{dir}..."
  Dir.chdir(dir) do
    puts `pwd`
    puts `git checkout master`
    puts `git pull`
    puts `git submodule update --init --recursive`
  end
end
