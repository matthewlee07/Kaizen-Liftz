class ExerciseEntry < ApplicationRecord
  belongs_to :workout_entry
  belongs_to :exercise
end
