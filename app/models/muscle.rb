class Muscle < ApplicationRecord
    before_save :titleize_name
    
    validates :name, presence: true, length: { maximum: 50, minimum: 2 }, uniqueness: { case_sensitive: false }
    
    has_many :intentions 
    has_many :exercises, :through => :intentions
    
    private 
        def titleize_name
            self.name = name.titleize
        end
end
