class UsersController < ApplicationController

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

    # READ
    def show
        @user = User.find(params[:id])
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
    # READ
    def get_workouts
        @user = User.find(params[:id])
    end

    def show_workout
        @workout = Workout.find(params[:workout_id])
    end

    # UPDATE
    def edit_workout
        @workout = Workout.find(params[:workout_id])
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end