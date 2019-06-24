class Exercise < ApplicationRecord
    before_save :titleize_name

    validate :has_muscle_requirements
    validates :name, presence: true, length: { maximum: 100, minimum: 1 }, uniqueness: { case_sensitive: false }
    validates :comments, length: { maximum: 1000 }
    
    has_many :intentions, dependent: :destroy
    has_many :muscles, :through => :intentions
    has_many :regiments 
    has_many :workouts, :through => :regiments
    
    accepts_nested_attributes_for :intentions, allow_destroy: true

    def muscle_intentions(intention_type)
        intentions.where(primary_muscle: intention_type == :primary)
    end

    private 
        def titleize_name
            self.name = name.titleize
        end

        def has_muscle_requirements
            errors.add(:muscles, "is required") unless intentions.map(&:muscle_id).any?
            errors.add(:primary_muscle, "is required") unless intentions.map(&:primary_muscle).any?
            if intentions.map(&:muscle_id).uniq != intentions.map(&:muscle_id)
                errors.add(:muscles, "not unique")
            end
        end
end
