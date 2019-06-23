Rails.application.routes.draw do
    root 'static_pages#home'
    get 'about', to: 'static_pages#about'
    devise_for :users

    authenticate :user do
        resources :users do 
            resources :workouts, controller: "users/workouts" do 
                resources :workout_entries, controller: "users/workouts/workout_entries"
            end
            resources :regiments, controller: "users/regiments"
        end
    end

    resources :muscles, :exercises, :workouts

end
