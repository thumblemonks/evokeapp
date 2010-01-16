require 'teststrap'

rails_context CollectionsController do
  # TODO: riot_rails, do this (see actionpack)
  # assert_routing :get, '/collections/foo', :controller => "collections", :action => "show", :id => "name"

  hookup do
    topic.resource = Class.new do
      def self.all; [Collection.new(:name => "baz"), Collection.new(:name => "boo")]; end
      def self.[](name) Collection.new(:name => "foo") if name == "foo"; end
    end
  end

  context "request for an existing collection" do
    setup do
      get :show, :id => "foo"
    end

    asserts_controller.response_code :ok
    asserts_controller.renders({:name => "foo"}.to_json)
  end # showing an existing collection

  context "request for a non-existent collection" do
    setup do
      get :show, :id => "bar"
    end

    asserts_controller.renders({:message => "Collection not found"}.to_json)
    asserts_controller.response_code :not_found
  end # showing a non-existent collection

  context "request for index of all collections" do
    setup do
      get :index
    end

    # TODO: asserts_response.content_type 'application/json'
    asserts_controller.response_code :ok
    asserts_controller.renders do
      [{:name => "baz"}, {:name => "boo"}].to_json
    end
  end # index of all collections

end # CollectionsController
