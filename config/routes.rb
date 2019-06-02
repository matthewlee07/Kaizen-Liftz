Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users

  authenticate :user do 
    get 'users/:id/workouts', to: 'logs#index'
  end

  resources :muscles, :exercises, :workouts, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
