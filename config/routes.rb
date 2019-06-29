Rails.application.routes.draw do
    root 'static_pages#home'
    get 'about', to: 'static_pages#about'
    devise_for :users

    authenticate :user do
        resources :users do 
            resources :workouts, controller: "users/workouts" do 
                resources :workout_entries, controller: "users/workout_entries" do 
                    post "start" => "workout_entries#start"
                    post "stop" => "workout_entries#stop"
                end
            end
            resources :regiments, controller: "users/regiments"
            resources :exercise_entries, controller: "users/exercise_entries"
        end
    end

    resources :muscles, :exercises, :workouts

end
