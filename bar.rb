require_relative('room.rb')
require_relative('goth.rb')
require_relative('hippy.rb')
require_relative('pop_enthusiast.rb')

class Bar

  attr_reader :name, :rooms

  def initialize(name)
    @name = name
    @rooms = []
  end

  def assign_room_to_guest?(guest)
    if guest.wallet >= 80
      large_room = Room.new(guest.name, :large)
      large_room.check_in_guest?(guest)
      @rooms << large_room
      guest.pay_for_room(80)
    elsif guest.wallet >= 50
      medium_room = Room.new(guest.name, :medium)
      medium_room.check_in_guest?(guest)
      @rooms << medium_room
      guest.pay_for_room(50)
    elsif guest.wallet >= 10
      small_room = Room.new(guest.name, :small)
      small_room.check_in_guest?(guest)
      @rooms << small_room
      guest.pay_for_room(10)
    else
      return false
    end
    return true
  end

  def add_guest_to_room?(added_guest, leader_name)
    for each_room in @rooms
      if each_room.name_of_lead_guest == leader_name
        return each_room.check_in_guest?(added_guest)
      end
    end
    return false
  end

  def check_out_guest?(removed_guest_name, leader)
    for each_room in @rooms
      if each_room.name_of_lead_guest == leader.name
        return each_room.check_out_guest?(removed_guest_name)
      end
    end
    return false
  end

  def view_room_info()
    info = ""
    for each_room in @rooms
      info += each_room.name_of_lead_guest + " 's " + each_room.type.to_s + " room - " + each_room.guests.length().to_s + " guest(s)\n\nSongs on the list:\n"+ each_room.get_playlist_as_string() + "\nOpinion's on music:\n" + each_room.guest_opinions_on_music() + "\n"
    end
    return info
  end




end
