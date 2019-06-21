Rails.application.routes.draw do
    root 'static_pages#home'
    get 'about', to: 'static_pages#about'
    devise_for :users

    authenticate :user do
        resources :users do 
            resources :workouts, controller: "users/workouts"
            resources :regiments, controller: "users/regiments"
        end
    end

    resources :muscles, :exercises, :workouts

end
