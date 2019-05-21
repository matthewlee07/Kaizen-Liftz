require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
    
    def setup 
        @workout = workouts(:one)
    end

    test "should be valid" do 
        assert @workout.valid?
    end
    # field should be present
    test "name should be present" do
        @workout.name = " " 
        assert_not @workout.valid?
    end
    # field length validation
    test "name should not be too long" do
        @workout.name = "a" * 101
        assert_not @workout.valid?
    end
    test "name should not be too short" do
        @workout.name = "a" * 0
        assert_not @workout.valid?
    end
     # field should be unique
     test "name should be unique" do
        duplicate_workout = @workout.dup
        duplicate_workout.name = @workout.name.upcase
        @workout.save
        assert_not duplicate_workout.valid?
    end
end
