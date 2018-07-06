require_relative("guest.rb")
require_relative("song.rb")

class Hippy < Guest

  def initialize(name)
    super(name, 10.0)
    set_favourite_song()
  end

  def set_favourite_song()
    song1 = Song.new("The Beatles - Happy Hippy Shake", :hippy)
    song2 = Song.new("Greater Than One - I Wanna be a Hippy", :hippy)
    song3 = Song.new("Simon and Garfunkel - The Sounds of Silence", :hippy)

    song_array = [song1, song2, song3]
    @favourite_song = song_array[rand(3)]
  end

  def opinion(feeling)
    if feeling == :happy
      return "Groovy, dude"
    else
      return "Bad vibes, man"
    end
  end



end
