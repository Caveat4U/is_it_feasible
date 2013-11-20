IsItFeasible::Application.routes.draw do
  resources :login
  #map / to /login
  root :to => redirect('/login')
end