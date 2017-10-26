require 'test_helper'

class FibreTest < ActiveSupport::TestCase
  def setup
    @fibre = Fibre.new(name: "123", number: 1, location: "A1", cabinet_name: "PS1", room: "401")
  end

  test "should be valid" do
    assert @fibre.valid?
  end

  test "name can't be blank" do
    @fibre.name = " "
    assert_not @fibre.valid?
  end

  test "number can't be blank" do
    @fibre.number = nil
    assert_not @fibre.valid?
  end

  test "location can't be blank" do
    @fibre.location = " "
    assert_not @fibre.valid?
  end

  test "cabinet_name can't be blank" do
    @fibre.cabinet_name = " "
    assert_not @fibre.valid?
  end

  test "room can't be blank" do
    @fibre.room = " "
    assert_not @fibre.valid?
  end

  # test "the truth" do
  #   assert true
  # end
end
