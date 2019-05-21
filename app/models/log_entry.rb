class LogEntry < ApplicationRecord
    # Should validate that stop_time is after start_time
    validates :log_id, presence: true
    validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2000 }
    validates :sets, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 } 
    validates :reps, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 } 
    validates :comments, length: { maximum:1000 }

    belongs_to :log
end
