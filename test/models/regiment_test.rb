require 'test_helper'

class RegimentTest < ActiveSupport::TestCase
    
    def setup 
        @regiment = regiments(:one)

    end

    test "should be valid" do 
        assert @regiment.valid?
    end
    # field should be present
    test "exercise_id should be present" do 
        @regiment.exercise_id = " "
        assert_not @regiment.valid?
    end
    test "workout_id should be present" do 
        @regiment.workout_id = " "
        assert_not @regiment.valid?
    end
    test "weight does not need to be present" do
        @regiment.weight = nil
        assert @regiment.valid?
    end
    test "sets should be present" do
        @regiment.sets = " "
        assert_not @regiment.valid?
    end
    test "reps should be present" do
        @regiment.reps = " "
        assert_not @regiment.valid?
    end
    # field integer validation
    test "weight should not be too large" do 
        @regiment.weight = 2001
        assert_not @regiment.valid?
    end
    test "sets should not be too large" do 
        @regiment.sets = 101
        assert_not @regiment.valid?
    end
    test "reps should not be too large" do 
        @regiment.reps = 101
        assert_not @regiment.valid?
    end
    test "sets should not be too small" do 
        @regiment.sets = 0
        assert_not @regiment.valid?
    end
    test "reps should not be too small" do 
        @regiment.reps = 0
        assert_not @regiment.valid?
    end
end
