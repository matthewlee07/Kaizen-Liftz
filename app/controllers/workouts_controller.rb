class WorkoutsController < ApplicationController\

  before_action :authenticate_user!, except: [:index, :show]

  # READ
  def index
    @workouts = Workout.where(user_id: nil).order(name: :asc).paginate(page: params[:page], :per_page => 10)
  end

  def show
    @workout = Workout.find(params[:id])
  end

  # CREATE
  def new
    @workout = Workout.new
    @workout.regiments.build
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout
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
      render :edit
    end
  end

  # DESTROY
  def destroy
    Workout.find(params[:id]).destroy
    redirect_to workouts_url
  end

  private
    def workout_params
      params.require(:workout).permit(:name, :exercise_id, regiments_attributes: [ :id, :exercise_id, :workout_id, :weight, :sets, :reps, :_destroy])
    end

  end
  