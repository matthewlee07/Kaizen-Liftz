module Users 
    class ExerciseEntriesController < ApplicationController
        
        def edit
            @exercise_entry = ExerciseEntry.find(params[:id])
        end

        def update
            @exercise_entry = ExerciseEntry.find(params[:id])
            if @exercise_entry.update_attributes(exercise_params)
                redirect_to user_workout_path(current_user, @exercise_entry.workout_entry.workout)
                else
                render 'edit'
                end
        end

        # DESTROY
        def destroy
            @workout = Workout.find(params[:id])
            @workout.destroy
            redirect_to user_workouts_path
        end

        private
            def exercise_params 
                params.require(:exercise_entry).permit(:weight, :sets, :reps, :comments)
            end
    end    
end
