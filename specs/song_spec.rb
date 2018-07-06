require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Sweet Home Alabama", :rock)
  end

  def test_get_name
    actual = @song1.name
    assert_equal("Sweet Home Alabama", actual)
  end

  def test_get_genre
    actual = @song1.genre
    assert_equal(:rock, actual)
  end








end
