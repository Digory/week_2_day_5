require('minitest/autorun')
require('minitest/rg')
require_relative('../goth.rb')

class TestGoth < MiniTest::Test

  def setup
    @goth = Goth.new("Digory")
  end

  def test_get_name
    actual = @goth.name
    assert_equal("Digory", actual)
  end

  def test_get_wallet
    actual = @goth.wallet
    assert_equal(100.0, actual)
  end

  def test_get_favourite_song_genre
    actual = @goth.favourite_song.genre
    assert_equal(:goth, actual)
  end

  def test_opinion__happy
    actual = @goth.opinion(:happy)
    assert_equal("I want to die", actual)
  end

  def test_opinion__sad
    actual = @goth.opinion(:sad)
    assert_equal("I want to die", actual)
  end









end
