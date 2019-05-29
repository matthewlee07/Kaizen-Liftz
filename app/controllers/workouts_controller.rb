class WorkoutsController < ApplicationController

 # CREATE
    # def create
    #     @workout = workout.new(workout_params)
    #     if @workout.save
    #     flash[:success] = "Created workout"
    #     redirect_to @workout
    #     else
    #     render :new
    #     end
    # end

    # def new
    #     @workout = workout.new if @workout == nil
    # end

    # READ
    # def show
    #     @workout = workout.find(params[:id])
    #     @projects = @workout.projects
    # end

    def index
        @workouts = Workout.paginate(page: params[:page], :per_page => 10)
    end

    # UPDATE
    # def edit
    #     @workout = workout.find(params[:id])
    # end

    # def update
    #     @workout = workout.find(params[:id])
    #     if @workout.update_attributes(workout_params)
    #     flash[:success] = "Updated workout"
    #     redirect_to @workout
    #     else
    #     render 'edit'
    #     end
    # end

    # DESTROY
    # def destroy
    #     workout.find(params[:id]).destroy
    #     flash[:success] = "Deleted workout"
    #     redirect_to workouts_url
    # end
    
    # private
    # def workout_params
    #     params.require(:workout).permit(:company, :address, :city, :state, :zip)
    # end
end
