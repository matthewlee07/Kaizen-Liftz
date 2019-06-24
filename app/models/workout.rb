class Workout < ApplicationRecord
    before_save :titleize_name

    # validate :has_exercise_requirements
    validates :name, presence: true, length: { maximum: 100, minimum: 1 }, uniqueness: { case_sensitive: false, scope: :user }

    has_many :regiments, dependent: :destroy
    has_many :exercises, :through => :regiments
    has_many :workout_entries, dependent: :destroy

    belongs_to :user, optional: true

    accepts_nested_attributes_for :regiments, allow_destroy: true

    private 
        def titleize_name
            self.name = name.titleize
        end

        def has_exercise_requirements
            if regiments.map(&:exercise_id).uniq != regiments.map(&:exercise_id)
                errors.add(:exercises, "not unique")
            end
        end
end
