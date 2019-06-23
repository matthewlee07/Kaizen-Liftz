class Exercise < ApplicationRecord
    before_save :titleize_name

    validate :has_muscle
    validate :has_primary_muscle 
    validate :has_unique_muscles

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

    def has_muscle
        errors.add(:muscles, "is required") unless intentions.map(&:muscle_id).any?
    end

    def has_primary_muscle
        errors.add(:primary_muscle, "is required") unless intentions.map(&:primary_muscle).any?
    end

    def has_unique_muscles
        if intentions.map(&:muscle_id).uniq != intentions.map(&:muscle_id)
            errors.add(:muscles, "not unique")
        end
    end

end