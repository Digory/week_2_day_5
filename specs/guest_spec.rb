require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Digory", 50)
  end

  def test_pay_for_room__wallet_reduces
    @guest1.pay_for_room(20)
    actual = @guest1.wallet
    assert_equal(30, actual)
  end

  def test_pay_for_room__wallet_cannot_go_below_zero
    @guest1.pay_for_room(60)
    actual = @guest1.wallet
    assert_equal(50, actual)
  end

  def test_opinion__happy
    actual = @guest1.opinion(:happy)
    assert_equal("This is a belter of a karaoke!", actual)
  end

  def test_opinion__sad
    actual = @guest1.opinion(:sad)
    assert_equal("I've had enough of this sh**e", actual)
  end









end
