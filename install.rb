home = File.expand_path('~')

#Dir['*'].each do |file|
#  puts file.inspect
#  next if file =~ /install/
#  target = File.join(home, ".#{file}")
#  `ln -ns #{File.expand_path file} #{target}`
#end

file = ".emacs"
[".emacs", ".emacs.d"].each do |file|
  target = File.join(home, file)
  `ln -ns #{File.expand_path file} #{target}`
end
