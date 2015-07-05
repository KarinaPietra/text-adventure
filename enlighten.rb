module Enlightenment

  $inventory = []
  $death_count = 0
  $run = 0
  $miss = 0

  # this method is for displaying the final stats in the game
  def stats
    if $death_count == 0
      print "You've never died. "
    elsif $death_count > 1
      print "You've died #{$death_count} times. "
    elsif $death_count < 0
      print "Your non-death might awaken something. "
    else
      print "You've died #{$death_count} time. "
    end

    if $inventory.empty?
      print "You have no items.\n"
      puts "Care to try again?"
    else
      print "You've collected:\n"
      puts $inventory
      puts
      puts "Care to try again?"
    end
  end


  # method for displaying options to user
  def display_choices
    puts <<-END
    What do you want to do?
    Options: #{yield}
    END
  end

 # method for introducing the game
  def intro_game
    puts <<-END
    You awaken in a bright room full of fog and
    as your eyes adjust, the fog lifts and you find yourself
    wanting more from life.

    END
    if $run == 1
      sleep(2)
      puts "Did you really think this was the end?"
      sleep(2)
    elsif $run == 2
      sleep(2)
      puts "You're not asleep and you're not awake."
      sleep(2)
    end
      display_choices {"(G)o through the door, (S)tay put, (I)nner journey"}
      $run  += 1
  end

  # method for the mid point
  def end_game
    puts <<-END
    You awaken in a bright room full of fog and
    as your eyes adjust, the fog lifts and you find yourself
    at a fork in the road.

    END
    display_choices {"(M)editate, (C)ontemplate, (I)ntrospect"}
  end

# the ask_player methods will present a series of situations for the player
# to deal with. past answers will affect the later methods. I hope.
  def ask_player
    case gets.chomp.upcase
    when "G"
      puts <<-END
      You step through the door, go about your life as usual with
      a nagging feeling in the back of your mind that there was something
      you wanted but can no longer remember. Finally, at your death bed,
      you remember. But by then...

      END
      sleep(2)
      $death_count += 1

    when "S"
      puts <<-END
      You decide staying in the room is much better than leaving the room.
      But you quickly get bored and go through the door. Life happens. Then
      you die.

      END
      sleep(2)
      $death_count += 1

    when "I"
      puts <<-END
      You close your eyes and focus on your breath.
      As you breathe in...and out.... you travel to the planes
      of the inner mind.

      END
      sleep(2)
  else
    puts <<-END
    You die from incompetence.

    END
    sleep(2)
    $miss += 1
    $death_count += 1
  end
end

  def ask_player2
    case gets.chomp.upcase
    when "G"
      puts <<-END
      You feel as if you have done this before but shake the feeling away
      as a simple case of deja vu. You face life just like you always have
      perhaps achieve a modicum of fame and fortune, but in the end,
      it didn't matter.

      END
      sleep(2)
      $death_count += 1
    when "S"
      puts <<-END
      Staying in the room isn't so bad, after all,
      you were in here for a reason.
      You notice a shiny object in the corner and bend over to inspect it.
      END
      sleep(2)
      display_choices {"(P)ick object up, (L)eave it be"}
      case gets.chomp.upcase
      when "P"
        puts <<-END
        You decide to pick it up. It appears to be a ring.

        END
        sleep(2)
        $inventory.push("ring")
      when "L"
        puts <<-END
        You don't want to mess with anything,
        you realize nothing in the room looks familiar. Where are you?

        END
        $inventory.push("map")
        sleep(2)
      else
        puts <<-END
        You've done it again. You die TWICE for your silliness.

        END
        sleep(2)
        $miss += 1
        $death_count += 2
      end
    when "I"
      puts <<-END
      You open your eyes and wonder if what you are seeing is real. You also
      can't seem to tell if you've ever died or not. Perhaps it's time to
      go through the door.

      END
      sleep(2)
      $death_count = -1
    else
      if $miss > 0
        puts <<-END
        Surprisingly, you don't die. Instead, you get a skunk.

        END
        sleep(2)
        $inventory.push("skunk")
      else
        puts "You die a million deaths."
        sleep(2)
        $death_count += 1000000
      end
    end
  end

  def ask_player3
    case gets.chomp.upcase
    when "42"
      puts "You found the meaning of life!"
      sleep(2)
      $inventory.push("Hitchhiker's Guide")
    else
      puts "At this point in your life, does the choice really matter?"
      puts
      sleep(2)
    end
  end

  def ask_player4
    if $death_count >= 3
      case gets.chomp.upcase
      when "M"
        puts <<-END
        You attempt to quiet your mind but it zips all over.

        END
      when "C"
        puts <<-END
        Perhaps you should avoid dying so often.

        END
      when "I"
        puts <<-END
        You realize death has no meaning.

        END
      else
        puts <<-END
        THIS IS JUST A GAME.

        END
      end
    elsif $inventory.include?("Hitchhiker's Guide")
      case gets.chomp.upcase
      when "ZAPHOD"
        puts "Stop being so sneaky with the easter eggs!"
      else
        puts "Well you're just a little sneak aren't you?"
      end
    elsif $inventory.include? "ring"
      case gets.chomp.upcase
      when "M"
        puts <<-END
        Your thoughts go to the ring you found previously, in, what?
        another life? another timeline? Perhaps if we went deeper,
        we'd find out more...

        END
      when "C"
        puts <<-END
        You think deeply about your options and realize they all mean the same
        thing. Maybe this is a clue to the correct path?

        END
      when "I"
        puts <<-END
        You may find this ending unsatisfying, but the simplest truths usually
        are.

        END
      else
        puts "Maybe your choice is better, maybe not."
      end
    elsif $inventory.include? "map"
      case gets.chomp.upcase
      when "M"
        puts <<-END
        You fish around your pockets and find a map. A map to the mind!
        Where shall you explore first? Traverse the plains of hilarity
        or will you speak to the other beings the dwell, hidden from view?
        Only you can decide!

        END
      when "C"
        puts <<-END
        You decide to embark on the biggest challenge of your life! This is,
        unquestionably, the most difficult expedition you will embark on. The
        end goal, to Be.

        END
      when "I"
        puts <<-END
        You've mapped out your life, now it's time to map out your next lives.
        All it takes is a leap.

        END
      else
        puts <<-END
        A rebellious mind may work for now, but eventually you will
        calm down. Wake up, now.

        END
      end
    elsif $inventory.include? "skunk"
      case gets.chomp.upcase
      when "M"
        puts <<-END
        You have a skunk. A SKUNK! Why, why didn't you just do what was asked?
        You and I know why. It's ok, though, I understand.

        END
      when "C"
        puts <<-END
        What's funny is that you kept the skunk. You smell atrocious, but you,
        yeah you, don't seem to care. Which is a good start.

        END
      when "I"
        puts <<-END
        You take the skunk out of your pocket (how on earth did
        it fit in there?!) and set it free. It thanks you by lifting its
        tail and spraying you with a scent unmatched by any garbage dump.
        But at least you didn't die.

        END
      else
        puts <<-END
        We just can't win with you, can we? You get a skunk and you still
        defy us. No matter, see you in the next life.

        END
      end
    elsif $miss > 0 and not $inventory.include? "skunk"
      case gets.chomp.upcase
      when "M"
        puts "If you go down this path, make sure you stink."
        sleep(2)
      else
        puts "Above all else, touch type."
        sleep(2)
      end
    else
      case gets.chomp.upcase
      when "M"
        puts "You entered empty handed, you leave empty handed."
      when "C"
        puts "Your true path begins here and now. With nothing."
      when "I"
        puts "A clean life, a clean path. You have always known. Keep at it."
      else
        puts <<-END
        A mistake is all that is needed to start your quest.
        You slipped and died.

        END
        $miss += 1
        $death_count += 1
      end
    end
  end
end