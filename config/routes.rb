IsItFeasible::Application.routes.draw do
  resources :users, :proposals, :reviews

  devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }

  root :to => 'user#dashboard'

  namespace :user do
  	root :to => 'user#dashboard'
  end
end