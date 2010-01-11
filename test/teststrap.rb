ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

Riot.dots if ENV["TM_MODE"]

# load File.join(File.dirname(__FILE__), '../db/schema.rb')
