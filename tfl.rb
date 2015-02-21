require 'pry'

bakerloo = ["Elephant & Castle", "Lambeth North", "Waterloo", "Embankment",
	"Charing Cross", "Picadilly Circus", "Oxford Circus", "Regent's Park",
	"Baker Street"]

central = ["Notting Hill Gate", "Queensway", "Lancaster Gate",
	"Marble Arch", "Bond Street", "Oxford Circus", "Tottenham Court Road",
	"Holborn", "Chancery Lane"]

victoria = ["Kings Cross", "Euston", "Warren Street", "Oxford Circus",
	"Green Park", "Victoria", "Pimlico"]

# lines = {:bakerloo=> ["Elephant & Castle", "Lambeth North", "Waterloo",
# 	"Embankment", "Charing Cross", "Picadilly Circus", "Oxford Circus",
# 	"Regent's Park","Baker Street"], :central=> ["Notting Hill Gate",
# 	"Queensway", "Lancaster Gate", "Marble Arch", "Bond Street", "Oxford Circus",
# 	"Tottenham Court Road", "Holborn", "Chancery Lane"], :victoria=> ["Kings
# 	Cross", "Euston", "Warren Street", "Oxford Circus", "Green Park",
# 	"Victoria", "Pimlico"]}

puts "Which line are you starting from? 1.Bakerloo, 2.Central or 3.Victoria
 line? Choose 1,2 or 3"
puts ">"
@dep_line = gets.chomp

second_question = "Which station are you departing from? You can choose
from the stations above."

case @dep_line
when "1"
  @dep_line = bakerloo
  puts bakerloo.join(", ")
  puts second_question
  puts ">"
  @dep_station = gets.chomp
when "2"
  @dep_line = central
  puts central.join(", ")
  puts second_question
  puts ">"
  @dep_station = gets.chomp.downcase
when "3"
  @dep_line = victoria
  print victoria.join(", ")
  puts second_question
  puts ">"
  @dep_station = gets.chomp.downcase
end

all_stations = bakerloo.join(", ") + central.join(", ") + victoria.join(", ")

second_dest_question = "Which is your destination? Choose from the stations above."

puts all_stations
puts second_dest_question

@destination = gets.chomp

def count_stops
  # binding.pry
  count = @dep_line.index(@destination).to_i-@dep_line.index(@dep_station).to_i
  stops = count.abs
  puts "Between #{@dep_station} and #{@destination} there are #{stops}
  stops which are the following :"
  puts @dep_line[(@dep_line.index(@dep_station)+1),count.abs].join(',')
end

count_stops

#user_input.downcase.gsub(" ","").to_sym
