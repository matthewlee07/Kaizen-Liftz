class Exercise < ApplicationRecord

    before_save :titleize_name

    validates :name, presence: true, length: { maximum: 100, minimum: 1 }, uniqueness: { case_sensitive: false }
    validates :comments, length: { maximum: 1000 }

    has_many :intentions 
    has_many :muscles, :through => :intentions
    has_many :regiments 
    has_many :workouts, :through => :regiments

    private 
    def titleize_name
        self.name = name.titleize
    end
end
