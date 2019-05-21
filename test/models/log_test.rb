require 'test_helper'

class LogTest < ActiveSupport::TestCase
    
    def setup 
        @log = logs(:one)
        @log_entry = log_entries(:one)
    end

    test "should be valid" do 
        assert @log.valid?
    end
    # field should be present
    test "user_id should be present" do 
        @log.user_id = " "
        assert_not @log.valid?
    end
    test "regiment_id should be present" do 
        @log.regiment_id = " "
        assert_not @log.valid?
    end
    # field length validation
    test "comments should not be too long" do
        @log.comments = "a" * 1001
        assert_not @log.valid?
    end
    # has_many destroy
    test "associated log_entries should be destroyed" do 
        @log.log_entries.create!(
            start_time: @log_entry.start_time, 
            stop_time: @log_entry.stop_time,
            weight: @log_entry.weight,
            sets: @log_entry.sets,
            reps: @log_entry.reps
        )
        assert_difference 'Log.count', -1 do 
            @log.destroy 
        end 
    end
end
