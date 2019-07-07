module Users 
    class WorkoutEntriesController < ApplicationController

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
            @workout = Workout.find(params[:workout_id])
            new_workout_entry = @workout.workout_entries.create!
            @workout.regiments.each do |regiment|
                new_workout_entry.exercise_entries.create!(exercise: regiment.exercise, sets: regiment.sets, reps: regiment.reps, weight: regiment.weight)
            end
            redirect_to user_workout_path(current_user, @workout)
        end
        
        def new 
            @workout = Workout.find(params[:workout_id])
        end

        # DESTROY
        def destroy
            workout_entry = WorkoutEntry.find(params[:id])
            workout_entry.destroy
            redirect_to user_workout_path(current_user, workout_entry.workout)
        end

    end    
end

