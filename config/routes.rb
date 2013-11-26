IsItFeasible::Application.routes.draw do
  devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }

  root to: redirect("/auth/login")

  namespace :user do
  	root :to redirect("/user")
  end

  match 'dashboard' => 'user_dashboard#index', :as => 'user_root'
end