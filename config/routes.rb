Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'site#index'
  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      get 'buildings', to: 'buildings#index'
    end
  end
end
