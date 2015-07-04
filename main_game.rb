require "./enlighten"
include Enlightenment

intro_game
ask_player
intro_game
ask_player2
intro_game
ask_player3
end_game
ask_player4

if $death_count > 1
  puts "You have died #{$death_count} times, and collected these items:"
  puts $inventory
  puts
  puts "Care to try again?"
else
  puts "You have died #{$death_count} time, and collected these items:"
  puts $inventory
  puts
  puts "Care to try again?"
