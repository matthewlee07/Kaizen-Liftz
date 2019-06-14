module Users

    class LogsController < ApplicationController

        def edit
            @log = Log.find(params[:id])
            @workout = @log.regiment.workout
            @exercise = @log.exercises.first
        end

        def update
            @log = Log.find(params[:id])
            if @log.update_attributes(log_params)
                redirect_to user_log_path(@log)
            else
                render 'edit'
            end
        end

        def show
            @log = Log.find(params[:id])
        end

        private
        def log_params
            params.require(:log).permit(:weight, :sets, :reps)
        end
    end
end