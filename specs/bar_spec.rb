require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')


class TestBar < MiniTest::Test

  def setup
    @bar = Bar.new("Digory's Bar")
    @goth = Goth.new("Dracula")
    @guest = Guest.new("Dustin", 5)
    @hippy = Hippy.new("Rainbow")
    @pop_enthusiast = PopEnthusiast.new("Jeremiah")
  end

  def test_assign_room_to_guest__returns_true
    actual = @bar.assign_room_to_guest?(@goth)
    assert_equal(true, actual)
  end

  def test_assign_room_to_guest__returns_false
    actual = @bar.assign_room_to_guest?(@guest)
    assert_equal(false, actual)
  end

  def test_add_guest_to_room__returns_true
    @bar.assign_room_to_guest?(@hippy)
    actual = @bar.add_guest_to_room?(@goth, @hippy.name)
    assert_equal(true, actual)
  end

  def test_add_guest_to_room__returns_false
    @bar.assign_room_to_guest?(@hippy)
    @bar.add_guest_to_room?(@goth, @hippy.name)
    @bar.add_guest_to_room?(@guest, @hippy.name)
    actual = @bar.add_guest_to_room?(@pop_enthusiast, @hippy.name)
    assert_equal(false, actual)
  end

  def test_add_guest_to_room__correct_size
    @bar.assign_room_to_guest?(@hippy)
    @bar.add_guest_to_room?(@goth, @hippy.name)
    @bar.add_guest_to_room?(@guest, @hippy.name)
    actual = @bar.rooms[0].guests.length
    assert_equal(3, actual)
  end

  def test_check_out_guest__returns_false
    @bar.assign_room_to_guest?(@hippy)
    @bar.add_guest_to_room?(@goth, @hippy.name)
    actual = @bar.check_out_guest?("Dustin", @hippy)
    assert_equal(false, actual)
  end

  def test_check_out_guest__returns_true
    @bar.assign_room_to_guest?(@hippy)
    @bar.add_guest_to_room?(@goth, @hippy.name)
    actual = @bar.check_out_guest?("Dracula", @hippy)
    assert_equal(true, actual)
  end












end
