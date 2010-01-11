require 'teststrap'

rails_context CollectionsController do
  # TODO: riot_rails, do this (see actionpack)
  # assert_routing :get, '/collections/foo', :controller => "collections", :action => "show", :id => "name"

  hookup do
    topic.resource = Class.new do
      def self.[](name)
        Collection.new if name == "foo"
      end
    end
  end

  context "showing an existing collection" do
    setup do
      get :show, :id => "foo"
    end

    asserts_controller.response_code :ok
    asserts_controller.renders_template :show

    asserts_controller.assigns(:collection)
  end # showing an existing collection

  context "showing a non-existent collection" do
    setup do
      get :show, :id => "bar"
    end

    asserts_controller.renders ''
    asserts_controller.response_code :not_found
  end # showing a non-existent collection

end # CollectionsController
