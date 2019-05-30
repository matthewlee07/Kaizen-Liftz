class Workout < ApplicationRecord

    before_save :titleize_name
    validates :name, presence: true, length: { maximum: 100, minimum: 1 }, uniqueness: { case_sensitive: false }

    has_many :regiments 
    has_many :exercises, :through => :regiments

    accepts_nested_attributes_for :regiments, allow_destroy: true

    private 
    def titleize_name
        self.name = name.titleize
    end
end
