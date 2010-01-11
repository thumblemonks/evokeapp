require 'teststrap'

rails_context Collection do
  asserts_topic.validates_presence_of :name

  asserts(:class).responds_to(:[])
end # rails Collection
