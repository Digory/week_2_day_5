require_relative("guest.rb")
require_relative("song.rb")

class PopEnthusiast < Guest

  def initialize(name)
    super(name, 50.0)
    set_favourite_song()
  end

  def set_favourite_song()
    song1 = Song.new("Carly Rae Jepson - Call Me Maybe", :pop)
    song2 = Song.new("Justin Bieber - Baby", :pop)
    song3 = Song.new("Pharell Williams - Happy", :pop)

    song_array = [song1, song2, song3]
    @favourite_song = song_array[rand(3)]
  end

  def opinion(feeling)
    if feeling == :happy
      return "I'm having a great time"
    else
      return  "This was a waste of money"
    end
  end



end
