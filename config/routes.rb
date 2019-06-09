Rails.application.routes.draw do
    root 'static_pages#home'
    get 'about', to: 'static_pages#about'
    devise_for :users

    authenticate :user do 
        get 'users/:id/workouts', to: 'users#get_workouts', as: 'get_workouts'
        get 'users/:id/workouts/:workout_id', to: 'users#show_workout', as: 'show_workout'
        get 'users/:id/workouts/:workout_id/edit', to: 'users#edit_workout', as: 'edit_workout'
        delete 'users/:id/workouts/:workout_id', to: 'users#destroy_workout', as: 'destroy_workout'
    end

    resources :muscles, :exercises, :workouts

end
