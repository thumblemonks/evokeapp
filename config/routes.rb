ActionController::Routing::Routes.draw do |map|
  map.resources :collections

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
