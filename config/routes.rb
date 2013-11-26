IsItFeasible::Application.routes.draw do
  #map '/'' to '/login'
  root :to => "home#/auth/login"

  devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  resources :users
end