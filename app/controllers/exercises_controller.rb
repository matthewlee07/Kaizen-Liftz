class ExercisesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    # READ
    def index
        @exercises = Exercise.order(name: :asc).paginate(page: params[:page], :per_page => 10)
    end

    def show
        @exercise = Exercise.find(params[:id])
    end

    # CREATE
    def create
        @exercise = Exercise.new(exercise_params)
        if @exercise.save            
            redirect_to @exercise
        else
            render :new
        end
    end

    def new
        @exercise = Exercise.new
        @exercise.intentions.build
    end

    # UPDATE
    def edit
        @exercise = Exercise.find(params[:id])
    end

    def update
        @exercise = Exercise.find(params[:id])
        if @exercise.update_attributes(exercise_params)
            redirect_to @exercise
        else
            render :edit
        end
    end

    # DESTROY
    def destroy
        Exercise.find(params[:id]).destroy
        redirect_to exercises_url
    end
    
    private
    def exercise_params
        params.require(:exercise).permit(:name, :comments, intentions_attributes: [ :id, :muscle_id, :primary_muscle, :_destroy])
    end

end
