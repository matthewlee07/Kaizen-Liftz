class WorkoutsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new]

    # CREATE
    def create
        @workout = Workout.new(workout_params)
        if @workout.save
            redirect_to @workout
        else
            render :new
        end
    end

    def new
        @workout = Workout.new if @workout == nil
    end

    # READ
    def show
        @workout = Workout.find(params[:id])
    end

    def index
        @workouts = Workout.paginate(page: params[:page], :per_page => 10)
    end

    # UPDATE
    # def edit
    #     @workout = Workout.find(params[:id])
    # end

    # def update
    #     @workout = Workout.find(params[:id])
    #     if @workout.update_attributes(workout_params)

    #     redirect_to @workout
    #     else
    #     render 'edit'
    #     end
    # end

    # DESTROY
    # def destroy
    #     Workout.find(params[:id]).destroy

    #     redirect_to workouts_url
    # end
    
    # private
    def workout_params
        params.require(:workout).permit(:name)
    end
end
