require 'teststrap'

rails_context Collection do
  hookup { topic.name = "foo" }

  context "with validations" do
    asserts_topic.validates_presence_of :name
  end

  asserts(:class).responds_to(:[])
  asserts(:json_options).equals(:only => [:name])
  asserts(:to_json).equals({:name => "foo"}.to_json)
end # rails Collection
