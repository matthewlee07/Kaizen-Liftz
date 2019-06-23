require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
    def setup
        @exercise = exercises(:one)
    end

    test "should be valid" do
        # fail because validate private methods
        assert @exercise.valid?
    end

    # field should be present
    test "name should be present" do
        @exercise.name = " " 
        assert_not @exercise.valid?
    end
    # field length validation
    test "name should not be too long" do
        @exercise.name = "a" * 101
        assert_not @exercise.valid?
    end
    test "comments should not be too long" do 
        @exercise.comments = "a" * 1001
        assert_not @exercise.valid?
    end
    test "name should not be too short" do
        @exercise.name = "a" * 0
        assert_not @exercise.valid?
    end
     # field should be unique
     test "name should be unique" do
        duplicate_exercise = @exercise.dup
        duplicate_exercise.name = @exercise.name.upcase
        @exercise.save
        assert_not duplicate_exercise.valid?
    end
end
