require 'test_helper'

class LogEntryTest < ActiveSupport::TestCase
    def setup 
        @log = logs(:one)
        @log_entry = log_entries(:one)
        @log_entry.log_id = @log.id
    end

    test "should be valid" do 
        assert @log_entry.valid?
    end 
    # field should be present
    test "log_id should be present" do
        @log_entry.log_id = " "
        assert_not @log_entry.valid?
    end
    test "weight should be present" do
        @log_entry.weight = " "
        assert_not @log_entry.valid?
    end
    test "sets should be present" do
        @log_entry.sets = " "
        assert_not @log_entry.valid?
    end
    test "reps should be present" do
        @log_entry.reps = " "
        assert_not @log_entry.valid?
    end
    # field integer validation
    test "weight should not be too large" do 
        @log_entry.weight = 2001
        assert_not @log_entry.valid?
    end
    test "sets should not be too large" do 
        @log_entry.sets = 101
        assert_not @log_entry.valid?
    end
    test "reps should not be too large" do 
        @log_entry.reps = 101
        assert_not @log_entry.valid?
    end
    test "weight should not be too small" do 
        @log_entry.weight = -1
        assert_not @log_entry.valid?
    end
    test "sets should not be too small" do 
        @log_entry.sets = 0
        assert_not @log_entry.valid?
    end
    test "reps should not be too small" do 
        @log_entry.reps = 0
        assert_not @log_entry.valid?
    end
    # field length validation
    test "comments should not be too long" do
        @log_entry.comments = "a" * 1001
        assert_not @log_entry.valid?
    end
    # time
    test "should accept valid start_time" do 
        @log_entry.start_time = DateTime.parse("2019-05-14 15:48:28")
        @log_entry.save!
        assert @log_entry.valid?
    end
    test "should accept valid stop_time" do 
        @log_entry.stop_time = DateTime.parse("2019-05-14 16:48:28")
        @log_entry.save!
        assert @log_entry.valid?
    end
end
