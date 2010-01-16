class CollectionsController < ApplicationController
  def index
    render :json => resource.all, :status => :ok
  end

  def show
    collection = resource[params[:id]]
    if collection
      render :json => collection, :status => :ok
    else
      render :json => {:message => "Collection not found"}, :status => :not_found
    end
  end
end
