IsItFeasible::Application.routes.draw do
  devise_for :users

  #map '/'' to '/login'
  root :to => "home#index"
end