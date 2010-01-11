class CollectionsController < ApplicationController
  def show
    @collection = resource.find(:first, :conditions => {:name => params[:id]})
    render(@collection ? 'show' : {:text => '', :status => :not_found})
  end
end
