Rails.application.routes.draw do
  namespace :api do  
  	namespace :v1 do   
  		resources :users
  		post '/set_app_user', to: 'users#set_app_user'
  	end 
  end
end
