class Regiment < ApplicationRecord

    validates :exercise_id, presence: true
    validates :weight, numericality: { only_integer: true, less_than_or_equal_to: 1000 }, allow_nil: true
    validates :sets, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 } 
    validates :reps, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 } 
    
    belongs_to :exercise
    belongs_to :workout

end
