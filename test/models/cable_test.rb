require 'test_helper'

class CableTest < ActiveSupport::TestCase
  def setup
    @cable = Cable.new(name: "123", from: "A1", to: "A5")
  end

  test "should be valid" do
    assert @cable.valid?
  end

  test "name can't be blank" do
    @cable.name = " "
    assert_not @cable.valid?
  end

  test "from can't be blank" do
    @cable.from = " "
    assert_not @cable.valid?
  end

  test "to can't be blank" do
    @cable.to = " "
    assert_not @cable.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
