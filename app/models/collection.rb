class Collection < ActiveRecord::Base
  validates_presence_of :name

  def self.[](name)
    find(:first, :conditions => {:name => name})
  end

  def json_options; {:only => [:name]}; end
  
  def to_json(options={})
    super(json_options.merge(options))
  end
end
