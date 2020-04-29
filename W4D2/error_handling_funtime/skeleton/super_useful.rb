# PHASE 2
def convert_to_int(str)
  Integer(str)

rescue ArgumentError 
puts nil

end

# PHASE 3


def reaction(maybe_fruit)
  # begin 
  fruits = ["apple", "banana", "orange"] 
    puts "OMG, thanks so much for the #{maybe_fruit}!" if fruits.include?(maybe_fruit)
    # raise ArgumentError.new "That's coffee"  if maybe_fruit == "coffee"
    rescue if maybe_fruit == "coffee"
      puts "try again"
      retry
      raise ArgumentError.new "Sorry, invalid fruit" if !fruits.include?(maybe_fruit)
    end
end


def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


