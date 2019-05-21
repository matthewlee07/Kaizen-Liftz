class Muscle < ApplicationRecord

    validates :name, presence: true, length: { maximum: 37, minimum: 2 }, uniqueness: { case_sensitive: false }

    has_many :intentions 
    has_many :exercises, :through => :intentions
    
end
