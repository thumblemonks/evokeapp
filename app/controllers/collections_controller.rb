class CollectionsController < ApplicationController
  def show
    @collection = resource[params[:id]]
    render(@collection ? 'show' : {:text => '', :status => :not_found})
  end
end
