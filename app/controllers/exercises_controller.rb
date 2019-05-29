class ExercisesController < ApplicationController

# CREATE
    # def create
    #     @exercise = exercise.new(exercise_params)
    #     if @exercise.save
    #     flash[:success] = "Created exercise"
    #     redirect_to @exercise
    #     else
    #     render :new
    #     end
    # end

    # def new
    #     @exercise = exercise.new if @exercise == nil
    # end

    # READ
    # def show
    #     @exercise = exercise.find(params[:id])
    #     @projects = @exercise.projects
    # end

    def index
        @exercises = Exercise.paginate(page: params[:page], :per_page => 10)
    end

    # UPDATE
    # def edit
    #     @exercise = exercise.find(params[:id])
    # end

    # def update
    #     @exercise = exercise.find(params[:id])
    #     if @exercise.update_attributes(exercise_params)
    #     flash[:success] = "Updated exercise"
    #     redirect_to @exercise
    #     else
    #     render 'edit'
    #     end
    # end

    # DESTROY
    # def destroy
    #     exercise.find(params[:id]).destroy
    #     flash[:success] = "Deleted exercise"
    #     redirect_to exercises_url
    # end
    
    # private
    # def exercise_params
    #     params.require(:exercise).permit(:company, :address, :city, :state, :zip)
    # end
end
