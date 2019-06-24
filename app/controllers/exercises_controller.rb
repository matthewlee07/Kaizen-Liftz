class ExercisesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

    # CREATE
    def create
        @exercise = Exercise.new(exercise_params)
        if @exercise.save            
            redirect_to exercises_path
        else
            render :new
        end
    end

    def new
        @muscle_options = Muscle.all.map{|muscle|[muscle.name, muscle.id]}
        @exercise = Exercise.new if @exercise == nil
        @exercise.intentions.build
    end

    # READ
    def show
        @exercise = Exercise.find(params[:id])
    end

    def index
        @exercises = Exercise.order(name: :asc).paginate(page: params[:page], :per_page => 10)
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
            render 'edit'
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
