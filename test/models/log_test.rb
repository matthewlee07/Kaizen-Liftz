require 'test_helper'

class LogTest < ActiveSupport::TestCase
    
    def setup 
        @log = logs(:one)
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
end
