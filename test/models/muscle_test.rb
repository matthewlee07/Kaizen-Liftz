require 'test_helper'

class MuscleTest < ActiveSupport::TestCase
    def setup
        @muscle = muscles(:one)
    end

    test "should be valid" do
        assert @muscle.valid?
    end
    # field should be present
    test "name should be present" do
        @muscle.name = " " 
        assert_not @muscle.valid?
    end
    # field length validation
    # test "name should not be too long" do
    #     @muscle.name = "a" * 38
    #     assert_not @muscle.valid?
    # end
    test "name should not be too short" do
        @muscle.name = "a" * 1
        assert_not @muscle.valid?
    end
     # field should be unique
     test "name should be unique" do
        duplicate_muscle = @muscle.dup
        duplicate_muscle.name = @muscle.name.upcase
        @muscle.save
        assert_not duplicate_muscle.valid?
    end
end
