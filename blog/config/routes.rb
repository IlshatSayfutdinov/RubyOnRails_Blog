Rails.application.routes.draw do
	get 'welcome/index'
	
	
	resources :comments do
	resources :comments
	end
	
	resources :articles do
	resources :comments 
	end
	root 'welcome#index'
end
