class Exercise < ApplicationRecord
    before_save :titleize_name

    validates :name, presence: true, length: { maximum: 100, minimum: 1 }, uniqueness: { case_sensitive: false }
    validates :comments, length: { maximum: 1000 }

    has_many :intentions, inverse_of: :exercise
    has_many :muscles, :through => :intentions
    has_many :regiments 
    has_many :workouts, :through => :regiments
    has_many :logs

    accepts_nested_attributes_for :intentions, allow_destroy: true

    def muscle_intentions(intention_type)
        intentions.where(primary_muscle: intention_type == :primary)
    end

    private 
    def titleize_name
        self.name = name.titleize
    end
end