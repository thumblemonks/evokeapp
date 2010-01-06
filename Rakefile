require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

# I HATE VERBOSE OUTPUT WITH NO GAIN. IT'S JUST NOISE, THEN!

Rake::Task["test:units"].clear
Rake::TestTask.new("test:units" => "db:test:prepare") do |t|
  t.libs << "test"
  t.pattern = 'test/unit/**/*_test.rb'
  t.verbose = false
end
Rake::Task['test:units'].comment = "Run the unit tests in test/unit (non-verbose)"

Rake::Task["test:functionals"].clear
Rake::TestTask.new("test:functionals" => "db:test:prepare") do |t|
  t.libs << "test"
  t.pattern = 'test/functional/**/*_test.rb'
  t.verbose = false
end
Rake::Task['test:functionals'].comment = "Run the functional tests in test/functional (non-verbose)"

task :test => ["test:units", "test:functionals"]
