require_relative("guest.rb")
require_relative("song.rb")

class Goth < Guest

  def initialize(name)
    super(name, 100)
    set_favourite_song()
  end

  def set_favourite_song()
    song1 = Song.new("Korn - Freak on a Leash", :goth)
    song2 = Song.new("HIM - The Sacrament", :goth)
    song3 = Song.new("Funeral for a Friend - Welcome Home Armageddon", :goth)

    song_array = [song1, song2, song3]
    @favourite_song = song_array[rand(3)]
  end

  def opinion(feeling)
    if feeling == :happy
      return "I want to die"
    else
      return "I want to die"
    end
  end



end
