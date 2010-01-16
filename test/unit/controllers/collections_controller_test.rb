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
    hookup { get :show, :id => "foo" }

    asserts_response(:content_type).equals('application/json')
    asserts_response.code :ok
    asserts_response.renders({:name => "foo"}.to_json)
  end # showing an existing collection

  context "request for a non-existent collection" do
    hookup { get :show, :id => "bar" }

    asserts_response(:content_type).equals('application/json')
    asserts_response.renders({:message => "Collection not found"}.to_json)
    asserts_response.code :not_found
  end # showing a non-existent collection

  context "request for index of all collections" do
    hookup { get :index }

    asserts_response(:content_type).equals('application/json')
    asserts_response.code :ok
    asserts_response.renders { [{:name => "baz"}, {:name => "boo"}].to_json }
  end # index of all collections

end # CollectionsController
