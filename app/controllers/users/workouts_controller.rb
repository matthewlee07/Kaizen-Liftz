module Users

    class WorkoutsController < ApplicationController

        # READ
        def index
            @user = User.find(params[:user_id])
            
            @workouts = @user.workouts
        end

        def show
            @workout = Workout.find(params[:id])
        end
        # CREATE
        def create
            @workout = Workout.find(params[:id])
            new_workout = current_user.workouts.create(name: @workout.name)
            @workout.regiments.each do |regiment|
                new_workout.regiments.create(exercise: regiment.exercise, sets: regiment.sets, reps: regiment.reps)
            end
            redirect_to user_workouts_path
        end

        def new
            @user = User.new if @user == nil
        end

        # UPDATE
        def edit
            @workout = Workout.find(params[:id])
        end

        def update
            @user = User.find(params[:id])
            if @user.update_attributes(user_params)
                redirect_to @user
            else
                render 'edit'
            end
        end

        # DESTROY
        def destroy
            @workout = Workout.find(params[:id])
            @workout.destroy
            # Log.where(regiment_id: regiments, user_id: current_user).destroy_all
            redirect_to user_workouts_path
        end

        private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end

    end
end