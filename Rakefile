# Jeff McCune <jeff@puppetlabs.com>
# 2010-12-03
#
# Basic Rakefile

task :default => [ "display_tasks" ]
task :autotest => [ "watchr" ]

desc "List available rake tasks"
task :display_tasks do
  system("rake -T")
end

desc "Start watchr spec/watchr.config"
task :watchr do
  system("watchr spec/watchr.config")
end

# vim:filetype=ruby
