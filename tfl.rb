require 'pry'
class Line
  attr_accessor :stations
  #use of a class variable in order to group all the
  #instances in an array and find the line that includes
  #the destination station.

  @@all = []

  def initialize (*stations)
    self.stations = stations
    # binding.pry
    @@all << self

  end

  def self.collect_instances
    # binding.pry
    @@all
  end

  # def self.collect_instances
  #   @instances = [];
  #   @instances << self
  #   @instances
  # end

  def set_station
    puts "Hello world!"
  end
end

@bakerloo = Line.new("Elephant & Castle", "Lambeth North", "Waterloo", "Embankment",
  "Charing Cross", "Picadilly Circus", "Oxford Circus", "Regent's Park",
  "Baker Street")
# binding.pry
@central = Line.new("Notting Hill Gate", "Queensway", "Lancaster Gate",
  "Marble Arch", "Bond Street", "Oxford Circus", "Tottenham Court Road",
  "Holborn", "Chancery Lane")

@victoria = Line.new("Kings Cross", "Euston", "Warren Street", "Oxford Circus",
  "Green Park", "Victoria", "Pimlico")

puts "Which line are you starting from? 1.Bakerloo, 2.Central or 3.Victoria
 line? Choose 1,2 or 3"
puts ">"
@dep_line = gets.chomp

second_question = "Which station are you departing from? You can choose
from the stations above."

case @dep_line
when "1"
  @dep_line = @bakerloo.stations
  puts @bakerloo.stations.join(", ")
  puts second_question
  puts ">"
  @dep_station = gets.chomp
when "2"
  @dep_line = @central.stations
  puts @central.stations.join(", ")
  puts second_question
  puts ">"
  @dep_station = gets.chomp.downcase
when "3"
  @dep_line = @victoria.stations
  print @victoria.stations.join(", ")
  puts second_question
  puts ">"
  @dep_station = gets.chomp.downcase
end

all_stations = @bakerloo.stations.join(", ") + @central.stations.join(", ") + @victoria.stations.join(", ")

second_dest_question = "Which is your destination? Choose from the stations above."

puts all_stations
puts second_dest_question

@destination = gets.chomp

def count_stops
  #Solution for stations that exist in the same line
  if @dep_line.include?(@destination)
    # binding.pry
    count = @dep_line.index(@destination).to_i-@dep_line.index(@dep_station).to_i
    stops = count.abs
    puts "Between #{@dep_station} and #{@destination} there are #{stops}
    stops which are the following :"
    puts @dep_line[(@dep_line.index(@dep_station)+1),count.abs].join(',')
  else
    #We call the class method collect_instances
    #in order to iterate over the array and find
    #in which line the destination station exists.
    @lines_array = Line.collect_instances
    @lines_array.each do |k|
      dest_line=k.stations if k.stations.include?(@destination)
    end


    # binding.pry
    # binding.pry
    #Solution for stations that exist in different lines
    #Use of ObjectSpace to find all the instances of a class
    # if @central.stations.include?(@destination)

    puts "Dont know yet!"

  end
end


count_stops

#user_input.downcase.gsub(" ","").to_sym
