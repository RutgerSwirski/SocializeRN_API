Rails.application.routes.draw do
  namespace :api do  
  	namespace :v1 do   
  		resources :users do 
        resources :reviews, only: [:create, :index]
  			resources :invites, only: [:create]
  		end
  		post '/set_app_user', to: 'users#set_app_user'
      post '/get_user_invites', to: 'invites#index'

      post '/get_accepted_user_invites', to: 'invites#get_accepted_user_invites'
      patch '/update_user_location', to: 'users#update_user_location'

      post '/get_nearby_users', to: 'users#get_nearby_users'
      
      resources :invites, only: :update
  	end 
  end
end
