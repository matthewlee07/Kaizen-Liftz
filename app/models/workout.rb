class Workout < ApplicationRecord

    validates :name, presence: true, length: { maximum: 100, minimum: 1 }, uniqueness: { case_sensitive: false }

    has_many :regiments 
    has_many :exercises, :through => :regiments
end
