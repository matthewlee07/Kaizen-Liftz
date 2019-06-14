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
            @user = User.new(user_params)
            # session[:return_to] ||= request.referer
            if @user.save
                log_in @user
                redirect_to(root_path)
            else
                render :new
            end
        end

        def new
            @user = User.new if @user == nil
        end

        # UPDATE
        def edit
            @user = User.find(params[:id])
        end

        def update
            @user = User.find(params[:id])
            if @user.update_attributes(user_params)
                redirect_to @user
            else
                render 'edit'
            end
        end

        # WORKOUT RELATED

        # UPDATE
        def edit_workout
            @workout = Workout.find(params[:workout_id])
        end

        # DESTROY
        def destroy
            regiments = Regiment.where(workout_id: params[:id])
            Log.where(regiment_id: regiments, user_id: current_user).destroy_all
            redirect_to user_workouts_path
        end

        private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end

    end
end