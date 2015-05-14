require 'standalone_migrations'
require 'rake/testtask'

StandaloneMigrations::Tasks.load_tasks

Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
end
