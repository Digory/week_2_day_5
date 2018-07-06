require_relative('bar.rb')

class UserInterface

def run()
  create_bar()
  display_options()
  puts "Thank you and goodnight."
end

def create_bar()
  puts "Welcome to your very own karaoke bar!\nWhat would you like the bar to be called?"
  bar_name = gets.chomp
  @bar = Bar.new(bar_name)
  puts "That's a great name."
end

def display_options()
  while(true)
    puts "\nHere are your options, type the appropriate number:\n
          1 - Create a new room\n
          2 - View all rooms\n
          3 - Add guest to room\n
          4 - Quit\n"
    input = gets.chomp.to_i
    case input
    when 1
      create_new_room()
    when 2
      view_all_rooms()
    when 3
      add_guest_to_room()
    when 4
      return
    else
      puts "Please enter valid input!"
    end
  end
end

def create_new_room()
 puts "What is the name of the guest in charge of the room?"
 lead_guest_name = gets.chomp
 puts "What kind of person are they?\n
      1 - Patriotic\n
      2 - Goth\n
      3 - Hippy\n
      4 - Pop Enthusiast"
  input = gets.chomp.to_i
  case input
  when 1
    lead_guest = Guest.new(lead_guest_name, 50)
  when 2
    lead_guest = Goth.new(lead_guest_name)
  when 3
    lead_guest = Hippy.new(lead_guest_name)
  when 4
    lead_guest = PopEnthusiast.new(lead_guest_name)
  else
    "Invalid input!\n"
    return
  end
  @bar.assign_room_to_guest?(lead_guest)
end

def view_all_rooms()
 puts @bar.view_room_info()
end

def add_guest_to_room()
  puts "What is the name of the guest?"
  guest_name = gets.chomp
  puts "What kind of person are they?\n
       1 - Patriotic\n
       2 - Goth\n
       3 - Hippy\n
       4 - Pop Enthusiast"
   input = gets.chomp.to_i
   case input
   when 1
     guest = Guest.new(guest_name, 50)
   when 2
     guest = Goth.new(guest_name)
   when 3
     guest = Hippy.new(guest_name)
   when 4
     guest = PopEnthusiast.new(guest_name)
   else
     "Invalid input!\n"
     return
   end
  puts "And whose room do you want to add them to?"
  lead_guest_name = gets.chomp
  if @bar.add_guest_to_room?(guest, lead_guest_name)
    puts "They've been added"
  else
    puts "There's too many people in that room already!"
  end
end

end

interface = UserInterface.new()
interface.run()
