class Intention < ApplicationRecord
    
    validates :muscle_id, presence: true
    validates :primary_muscle, inclusion: {in: [true, false]}

    belongs_to :exercise
    belongs_to :muscle
end
