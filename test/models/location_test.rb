require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Location.new(name: "A1")
  end

  test "should be valid" do
    assert @location.valid?
  end

  test "name can't be blank" do
    @location.name = " "
    assert_not @location.valid?
  end

  test "name should be unique" do
    duplicate_location = @location.dup
    duplicate_location.name = @location.name
    @location.save
    assert_not duplicate_location.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
