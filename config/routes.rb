Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      get 'buildings', to: 'buildings#index'
      get 'building_favorited', to: 'buildings#change_user_favorite_building'
    end
  end
  
  root 'site#index'
end
