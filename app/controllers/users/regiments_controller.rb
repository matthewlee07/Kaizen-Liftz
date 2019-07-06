module Users
    class RegimentsController < ApplicationController

        # UPDATE
        def edit
            @regiment = Regiment.find(params[:id])
        end

        def update
            @regiment = Regiment.find(params[:id])
            if @regiment.update_attributes(regiment_params)
                redirect_to user_workout_path(current_user, @regiment.workout)
            else
                render :edit
            end
        end

        private
        def regiment_params
            params.require(:regiment).permit(:weight, :sets, :reps)
        end
    end
end