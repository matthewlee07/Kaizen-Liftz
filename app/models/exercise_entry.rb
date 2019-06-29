class ExerciseEntry < ApplicationRecord
    validates :weight, numericality: { only_integer: true, less_than_or_equal_to: 1000 }, allow_nil: true
    validates :sets, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 } 
    validates :reps, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 } 


  belongs_to :workout_entry
  belongs_to :exercise
end
