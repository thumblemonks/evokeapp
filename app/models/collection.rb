class Collection < ActiveRecord::Base
  validates_presence_of :name

  def self.[](name)
    find(:first, :conditions => {:name => name})
  end
end
