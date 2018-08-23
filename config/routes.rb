Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'auth/sign_in' => 'user_token#create'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :blogs do
        resources :comments do
        end
      end
    end
  end
end