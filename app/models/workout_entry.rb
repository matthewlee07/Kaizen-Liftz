class WorkoutEntry < ApplicationRecord

    validates :workout_id, presence: true

    belongs_to :workout
end
