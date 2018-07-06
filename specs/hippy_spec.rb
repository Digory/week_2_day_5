require('minitest/autorun')
require('minitest/rg')
require_relative('../hippy.rb')

class TestHippy < MiniTest::Test

  def setup
    @hippy = Hippy.new("Digory")
  end

  def test_get_name
    actual = @hippy.name
    assert_equal("Digory", actual)
  end

  def test_get_wallet
    actual = @hippy.wallet
    assert_equal(10.0, actual)
  end

  def test_get_favourite_song_genre
    actual = @hippy.favourite_song.genre
    assert_equal(:hippy, actual)
  end

  def test_opinion__happy
    actual = @hippy.opinion(:happy)
    assert_equal("Groovy, dude", actual)
  end

  def test_opinion__sad
    actual = @hippy.opinion(:sad)
    assert_equal("Bad vibes, man", actual)
  end









end
