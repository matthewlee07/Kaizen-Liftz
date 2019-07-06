module Users
    class WorkoutsController < ApplicationController

        # READ
        def index
            @user = User.find(params[:user_id])
            @workouts = @user.workouts.order(name: :asc).paginate(page: params[:page], :per_page => 10)
        end

        def show
            @workout = Workout.find(params[:id])
            @workout_entries = @workout.workout_entries.order(created_at: :desc) 
        end

        # CREATE
        def create
            workout = Workout.find(params[:workout][:id])
            new_workout = current_user.workouts.build(name: workout.name)
            workout.regiments.each do |regiment|
                new_workout.regiments.build(exercise: regiment.exercise, sets: regiment.sets, reps: regiment.reps, weight: regiment.weight)
            end
            new_workout.save!
            redirect_to workouts_path
        end

        # DESTROY
        def destroy
            Workout.find(params[:id]).destroy
            redirect_to user_workouts_path
        end

    end
end