Rails.application.routes.draw do
  # resources :issues
  # resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/payload', to: 'api/v1/issues#create'

  namespace :api do
    namespace :v1 do
        resources :issues, only: [] do
          resources :events, only: :index
        end
      end
    end 
end
