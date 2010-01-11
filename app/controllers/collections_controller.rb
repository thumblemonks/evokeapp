class CollectionsController < ApplicationController
  def index
    @collections = resource.all
  end

  def show
    @collection = resource[params[:id]]
    render(@collection ? 'show' : {:text => '', :status => :not_found})
  end
end
