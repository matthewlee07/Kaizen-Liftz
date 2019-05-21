class Exercise < ApplicationRecord

    validates :name, presence: true, length: { maximum: 100, minimum: 1 }, uniqueness: { case_sensitive: false }
    validates :comments, length: { maximum: 1000 }

end
