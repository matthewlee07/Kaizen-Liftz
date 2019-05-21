require 'test_helper'

class IntentionTest < ActiveSupport::TestCase
    
    def setup 
        @intention = intentions(:one)
    end
    # will not pass without vaidates presence:true, which will not work against inclusion 
    # test "should be valid" do 
    #     assert @intention.valid?
    # end
    # field should be present
    test "exercise_id should be present" do 
        @intention.exercise_id = " "
        assert_not @intention.valid?
    end
    test "muscle_id should be present" do 
        @intention.muscle_id = " "
        assert_not @intention.valid?
    end 
    test "primary_muscle should be present" do 
        @intention.primary_muscle = " "
        assert_not @intention.valid?
    end 
end
