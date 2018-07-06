require_relative("song.rb")

class Guest

  attr_reader :name, :favourite_song, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
    @favourite_song = Song.new("Oh Flower of Scotland", :patriotic)
  end

  def pay_for_room(amount)
    return if @wallet - amount < 0
    @wallet -= amount
  end

  def opinion(feeling)
    if feeling == :happy
      return "This is a belter of a karaoke!"
    else
      return "I've had enough of this sh**e"
    end
  end


end
