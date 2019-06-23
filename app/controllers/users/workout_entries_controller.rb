module Users 
    class Users::WorkoutEntriesController < ApplicationController
        # READ
        def index
            @user = User.find(params[:user_id])
            @workouts = @user.workouts.order(name: :asc).paginate(page: params[:page], :per_page => 10)
        end

        def show
            @workout = Workout.find(params[:id])
        end
        # CREATE
        def create
            @workout = Workout.find(params[:workout][:id])
            new_workout = current_user.workouts.create!(name: @workout.name)
            @workout.regiments.each do |regiment|
                new_workout.regiments.create!(exercise: regiment.exercise, sets: regiment.sets, reps: regiment.reps)
            end
            redirect_to user_workouts_path(current_user)
        end

        # DESTROY
        def destroy
            @workout = Workout.find(params[:id])
            @workout.destroy
            redirect_to user_workouts_path
        end
    end    
end

