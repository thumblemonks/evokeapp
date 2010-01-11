require 'teststrap'

context "A resourceful controller" do
  setup do
    ResourcefulFoo = Class.new {}
    ResourcefulFoosController = Class.new do
      include ResourcefulController
    end
    ResourcefulFoosController.new
  end

  asserts_topic.responds_to(:resource)
  asserts_topic.responds_to(:resource=)

  asserts(:resource).equals { ResourcefulFoo }

  asserts("resource uses provided value") do
    topic.resource = "bar"
    topic.resource
  end.equals("bar")
end # A resourceful controller
