class ApplicationController < ActionController::Base
  include ResourcefulController

  # helper :all # include all helpers, all the time
  protect_from_forgery
  filter_parameter_logging :password
end
