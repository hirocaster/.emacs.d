require 'rake'

task :default => [:test]
task :test do
  system 'emacs -batch -Q -L test -l ./init.el'
  exit 1 unless $?.success?
  system 'emacs -batch -Q -L test -l ./init.el -l ./test/load-packages.el'
  exit 1 unless $?.success?
  puts 'All tests successful.'
end

task :travis => [:delete_emacs_d, :link, :default]
task :delete_emacs_d do
  system "rm -rf $HOME/.emacs.d"
end
task :link do
  system "ln -s #{Dir.pwd}/ $HOME/.emacs.d"
end
