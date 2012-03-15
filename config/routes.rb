ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  
  map.resources :snippets

  map.root :controller => "snippets"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
