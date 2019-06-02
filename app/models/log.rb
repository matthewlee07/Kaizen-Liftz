class Log < ApplicationRecord

    validates :user_id, presence: true
    validates :regiment_id, presence: true
    validates :comments, length: { maximum: 1000 }

    belongs_to :user
    belongs_to :regiment
    has_many :log_entries, dependent: :destroy

    def workout_regiments(user_id)
        regiments.where(user_id: user_id)
    end

end
