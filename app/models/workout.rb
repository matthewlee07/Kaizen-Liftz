class Workout < ApplicationRecord
    before_save :titleize_name
    
    validates :name, presence: true, length: { maximum: 100, minimum: 1 }, uniqueness: { case_sensitive: false, scope: :user }

    has_many :regiments, inverse_of: :workout, dependent: :destroy 
    has_many :exercises, :through => :regiments

    belongs_to :user, optional: true

    accepts_nested_attributes_for :regiments, allow_destroy: true

    private 
    def titleize_name
        self.name = name.titleize
    end
end
