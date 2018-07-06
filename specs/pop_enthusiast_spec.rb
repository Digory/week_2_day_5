require('minitest/autorun')
require('minitest/rg')
require_relative('../pop_enthusiast.rb')

class TestPopEnthusiast < MiniTest::Test

  def setup
    @pop_enthusiast = PopEnthusiast.new("Digory")
  end

  def test_get_name
    actual = @pop_enthusiast.name
    assert_equal("Digory", actual)
  end

  def test_get_wallet
    actual = @pop_enthusiast.wallet
    assert_equal(50.0, actual)
  end

  def test_get_favourite_song_genre
    actual = @pop_enthusiast.favourite_song.genre
    assert_equal(:pop, actual)
  end

  def test_opinion__happy
    actual = @pop_enthusiast.opinion(:happy)
    assert_equal("I'm having a great time", actual)
  end

  def test_opinion__sad
    actual = @pop_enthusiast.opinion(:sad)
    assert_equal("This was a waste of money", actual)
  end









end
