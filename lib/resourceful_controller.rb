module ResourcefulController
  def self.included(klass)
    klass.class_eval { attr_writer :resource }
  end

  def resource
    @resource ||= default_resource
  end

private
  def default_resource
    self.class.name.gsub(/Controller$/, '').constantize
  end
end
