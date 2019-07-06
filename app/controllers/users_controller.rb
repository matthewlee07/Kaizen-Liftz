class UsersController < ApplicationController

    # CREATE
    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to(root_path)
        else
            render :new
        end
    end

    def new
        @user = User.new
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
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end