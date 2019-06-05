Rails.application.routes.draw do
    root 'static_pages#home'
    devise_for :users

    authenticate :user do 
        get 'users/:id/workouts', to: 'users#get_workouts', as: 'get_workouts'
    end

    resources :muscles, :exercises, :workouts

end
