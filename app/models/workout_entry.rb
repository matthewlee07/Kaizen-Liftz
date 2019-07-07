class WorkoutEntry < ApplicationRecord

  validates :workout_id, presence: true
  has_many :exercise_entries, dependent: :destroy
  belongs_to :workout

end
