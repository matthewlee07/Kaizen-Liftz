class WorkoutsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new]

    # READ
    def index
        @workouts = Workout.where(user_id: nil).order(name: :asc).paginate(page: params[:page], :per_page => 10)
    end

    def show
        @workout = Workout.find(params[:id])
    end
    
    # CREATE
    def new
        @exercise_options = Exercise.all.map{|exercise|[exercise.name, exercise.id]}
        @workout = Workout.new if @workout == nil
        @workout.regiments.build
    end

    def create
        @workout = Workout.new(workout_params)
        if @workout.save
            redirect_to workouts_path
        else
            render :new
        end
    end

    # UPDATE
    def edit
        @workout = Workout.find(params[:id])
    end

    def update
        @workout = Workout.find(params[:id])
        if @workout.update_attributes(workout_params)

        redirect_to @workout
        else
        render 'edit'
        end
    end

    # DESTROY
    def destroy
        Workout.find(params[:id]).destroy
        # if workout has dependent then error page
        redirect_to workouts_url
    end
    
    # private
    def workout_params
        params.require(:workout).permit(:name, :exercise_id, regiments_attributes: [ :id, :exercise_id, :workout_id, :weight, :sets, :reps, :_destroy])
    end
end
