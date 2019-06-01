class LogsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new]

    # CREATE
    # def create
    #     @log = Log.new(log_params)
    #     if @log.save
    #         redirect_to logs_path
    #     else
    #         render :new
    #     end
    # end

    # def new
    #     @exercise_options = Exercise.all.map{|exercise|[exercise.name, exercise.id]}
    #     @log = Log.new if @log == nil
    #     @log.regiments.build #ehhhh?
    # end

    # READ
    # def show
    #     @log = Log.find(params[:id])
    # end

    def index
        # @logs = Log.where(user_id: current_user.id)
    end

    # UPDATE
    # def edit
    #     @log = Log.find(params[:id])
    # end

    # def update
    #     @log = Log.find(params[:id])
    #     if @log.update_attributes(log_params)

    #     redirect_to @log
    #     else
    #     render 'edit'
    #     end
    # end

    # DESTROY
    # def destroy
    #     Log.find(params[:id]).destroy

    #     redirect_to logs_url
    # end
    
    # private
    def log_params
        params.require(:log).permit(:name, :exercise_id)
    end
end
