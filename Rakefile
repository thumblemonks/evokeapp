require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

# @todo Rails insists on loading its own test stuff despite my wishes and we have our tests structured.
# So, we're clearing out test:* cuz we can
Rake.application.tasks.each do |task|
  next unless task.name =~ /^test(:.+)?$/
  Rake::Task[task.name].clear
end

# I HATE VERBOSE OUTPUT WITH NO GAIN. IT'S JUST NOISE, THEN!

def shhhh(&block)
  old_output, $stdout = $stdout, StringIO.new
  yield
ensure
  $stdout = old_output
end

namespace :test do
  desc "Sets the Rails environment to test mode and loads the environment"
  task :environment do
    RAILS_ENV = ENV['RAILS_ENV'] = 'test'
    Rake::Task['environment'].invoke
    shhhh do
      Rake::Task['db:reset'].invoke
      # Rake::Task['db:schema:load'].invoke
      # Rake::Task['db:migrate'].invoke
    end
  end

  %w[unit functional performance].each do |scope|
    desc "Run the #{scope} tests"
    Rake::TestTask.new(scope => "test:environment") do |t|
      t.libs << "test"
      t.pattern = "test/#{scope}/**/*_test.rb"
      t.verbose = false
    end  
  end
end

task :test => ["test:unit", "test:functional"]

desc "Rebundle the riot gems"
task "rebundle:riot" do
  %x[rm -fr bundled/gems/gems/riot* bundled/gems/dirs/riot* bundled/gems/specifications/riot* && gem bundle]
end
