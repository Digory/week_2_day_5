require_relative('guest.rb')

class Room

  attr_reader :type, :capacity, :guests, :playlist, :name_of_lead_guest

def initialize(name_of_lead_guest, type)
  @name_of_lead_guest = name_of_lead_guest
  @type = type
  @guests = []
  @playlist = []
  assign_capacity()
  create_playlist()
  find_amount_of_each_genre_in_playlist()
end

def assign_capacity()
  case @type
  when :small
    @capacity = 3
  when :medium
    @capacity = 8
  when :large
    @capacity = 20
  end
end

def check_in_guest?(guest)
  return false if @capacity == 0
  @guests << guest
  @capacity -= 1
  return true
end

def check_out_guest?(guest_name)
  for each_guest in @guests
    if each_guest.name == guest_name
      @guests.delete(each_guest)
      return true
    end
  end
  return false
end

def create_playlist()
  song1 = Song.new("Korn - Freak on a Leash", :goth)
  song2 = Song.new("HIM - The Sacrament", :goth)
  song3 = Song.new("Funeral for a Friend - Welcome Home Armageddon", :goth)
  song4 = Song.new("The Beatles - Happy Hippy Shake", :hippy)
  song5 = Song.new("Greater Than One - I Wanna be a Hippy", :hippy)
  song6 = Song.new("Simon and Garfunkel - The Sounds of Silence", :hippy)
  song7 = Song.new("Carly Rae Jepson - Call Me Maybe", :pop)
  song8 = Song.new("Justin Bieber - Baby", :pop)
  song9 = Song.new("Pharell Williams - Happy", :pop)
  song10 = Song.new("Oh Flower of Scotland", :patriotic)

  all_songs = [song1, song2, song3, song4, song5, song6, song7, song8, song9, song10]

  @playlist = all_songs.shuffle[0..4]
end

def get_playlist_as_string()
  playlist_as_string = ""
  @playlist.each do |song|
    playlist_as_string += song.name + "\n"
  end
  return playlist_as_string
end

def guest_opinions_on_music()
  guest_opinions = ""
  for each_guest in @guests
    case each_guest.favourite_song.genre
    when :goth
      if @number_of_goth_songs >= 1
        opinion = each_guest.opinion(:happy)
      else
        opinion = each_guest.opinion(:sad)
      end
    when :hippy
      if @number_of_hippy_songs >= 1
        opinion = each_guest.opinion(:happy)
      else
        opinion = each_guest.opinion(:sad)
      end
    when :pop
      if @number_of_pop_songs >= 1
        opinion = each_guest.opinion(:happy)
      else
        opinion = each_guest.opinion(:sad)
      end
    when :patriotic
      if @number_of_patriotic_songs >= 1
        opinion = each_guest.opinion(:happy)
      else
        opinion = each_guest.opinion(:sad)
      end
  end
  opinion.upcase! if playlist_contains_favourite_song?(each_guest)
  guest_opinions += each_guest.name + ": " + opinion +"\n"
end
return guest_opinions
end

def find_amount_of_each_genre_in_playlist()
  @number_of_goth_songs = 0
  @number_of_hippy_songs = 0
  @number_of_pop_songs = 0
  @number_of_patriotic_songs = 0

  for each_song in @playlist
    case each_song.genre
    when :goth
      @number_of_goth_songs += 1
    when :hippy
      @number_of_hippy_songs += 1
    when :pop
      @number_of_pop_songs += 1
    when :patriotic
      @number_of_patriotic_songs += 1
    end
  end
end

def playlist_contains_favourite_song?(guest)
  array_of_song_titles = []
  for each_song in @playlist
    array_of_song_titles << each_song.name
  end
  return array_of_song_titles.include?(guest.favourite_song.name)
end


end
