require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../goth.rb')

class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new("Kieran", 5)
    @room = Room.new("Kieran", :small)
    @guest2 = Guest.new("Annie", 10)
    @guest3 = Guest.new("Dave", 15)
    @guest4 = Goth.new("Dracula")
    @guest5 = Guest.new("Jeremy", 20)
  end

  def test_get_type
    actual = @room.type
    assert_equal(:small, actual)
  end

  def test_get_capacity
    actual = @room.capacity
    assert_equal(3, actual)
  end

  def test_capacity_reduces_when_guest_checked_in
    @room.check_in_guest?(@guest1)
    actual = @room.capacity
    assert_equal(2, actual)
  end

  def test_capacity_returns_true_when_guest_checked_in
    actual = @room.check_in_guest?(@guest1)
    assert_equal(true, actual)
  end

  def test_capacity_cannot_fall_below_0
    @room.check_in_guest?(@guest1)
    @room.check_in_guest?(@guest2)
    @room.check_in_guest?(@guest3)
    @room.check_in_guest?(@guest4)
    actual = @room.capacity
    assert_equal(0, actual)
  end

  def test_add_too_many_returns_false
    @room.check_in_guest?(@guest1)
    @room.check_in_guest?(@guest2)
    @room.check_in_guest?(@guest3)
    actual = @room.check_in_guest?(@guest4)
    assert_equal(false, actual)
  end

  def test_return_a_playlist_of_correct_length
    actual = @room.playlist.length
    assert_equal(6, actual)
  end

  def test_check_out_guest__returns_false
    @room.check_in_guest?(@guest1)
    actual = @room.check_out_guest?("Jeremy")
    assert_equal(false, actual)
  end

  def test_check_out_guest__returns_true
    @room.check_in_guest?(@guest5)
    actual = @room.check_out_guest?("Jeremy")
    assert_equal(true, actual)
  end

  def test_opinions_on_music
    @room.check_in_guest?(@guest1)
    @room.check_in_guest?(@guest2)
    @room.check_in_guest?(@guest4)

    p @room.guest_opinions_on_music()
  end









end
