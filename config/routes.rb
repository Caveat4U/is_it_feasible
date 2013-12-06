IsItFeasible::Application.routes.draw do
	resources :reviews
	resources :proposals

	devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :registration => 'register', :sign_up => 'cmon_let_me_in' }

	authenticate :user do
		root :to => 'proposals#index', as: :authenticated_user
	end

	root :to => 'user#dashboard'
end
