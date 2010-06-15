ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'home'
map.devise_for :users

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end