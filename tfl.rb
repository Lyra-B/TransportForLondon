require 'pry'
class Line
  attr_accessor :stations
  #use of a class variable in order to group all the
  #instances in an array and find the line that includes
  #the destination station.
  #Inspiration from here:
  #http://stackoverflow.com/questions/6365638/how-to-get-class-instances-in-ruby

  @@all = []

  def initialize (*stations)
    self.stations = stations
    @@all << self

  end

  def self.collect_instances
    @@all
  end
end

@bakerloo = Line.new("Elephant & Castle", "Lambeth North", "Waterloo", "Embankment",
  "Charing Cross", "Picadilly Circus", "Oxford Circus", "Regent's Park",
  "Baker Street")
@central = Line.new("Notting Hill Gate", "Queensway", "Lancaster Gate",
  "Marble Arch", "Bond Street", "Oxford Circus", "Tottenham Court Road",
  "Holborn", "Chancery Lane")
@victoria = Line.new("Kings Cross", "Euston", "Warren Street", "Oxford Circus",
  "Green Park", "Victoria", "Pimlico")

all_stations = @bakerloo.stations.join(", ") + "," + @central.stations.join(", ") + "," + @victoria.stations.join(", ")
puts all_stations
puts "Which station are you departing from? Choose from the stations above."
puts ">"
@dep_station = gets.chomp
puts all_stations
puts "Which is your destination? Choose from the stations above."
puts ">"
@destination = gets.chomp

#We call the class method collect_instances
#in order to iterate over the array and find
#in which line the destination station and
#the departure station exists.
@lines_array = Line.collect_instances
@lines_array.each do |k|
  @dep_line =k.stations if k.stations.include?(@dep_station)
  @dest_line=k.stations if k.stations.include?(@destination)
end



def count_stops
  #Solution for stations that exist in the same line
  if @dep_line.include?(@destination)
    count = @dep_line.index(@destination).to_i-@dep_line.index(@dep_station).to_i
    stops = count.abs
    puts "Between #{@dep_station} and #{@destination} there are #{stops} stops which are the following :"
    if @dep_line.index(@destination).to_i==@dep_line.index(@dep_station).to_i
      puts "No stations to show!"
    elsif @dep_line.index(@destination).to_i>@dep_line.index(@dep_station).to_i
      puts @dep_line[(@dep_line.index(@dep_station)+1),count.abs].join(',')
    else
      @dep_line_rev = @dep_line.reverse
      puts @dep_line_rev[(@dep_line_rev.index(@dep_station)+1),count.abs].join(',')
    end
  else
    #Solution for stations that exist in different lines
    count1 = @dep_line.index("Oxford Circus").to_i-@dep_line.index(@dep_station).to_i
    stops1 = count1.abs
    count2 = @dest_line.index("Oxford Circus").to_i-@dest_line.index(@destination).to_i
    stops2 = count2.abs
    stops = stops1+stops2
    puts "Between #{@dep_station} and #{@destination} there are #{stops} stops which are the following :"
    @dep_line_rev = @dep_line.reverse
    @dest_line_rev = @dest_line.reverse
    oxford_dep = @dep_line.index("Oxford Circus").to_i
    oxford_dep_rev = @dep_line_rev.index("Oxford Circus").to_i
    oxford_dest = @dest_line.index("Oxford Circus").to_i
    oxford_dest_rev = @dest_line_rev.index("Oxford Circus").to_i
    dep = @dep_line.index(@dep_station).to_i
    dep_r = @dep_line_rev.index(@dep_station).to_i
    dest = @dest_line.index(@destination).to_i
    dest_r = @dest_line_rev.index(@destination).to_i
    if dep<oxford_dep
      sub_arr1 = @dep_line[(dep+1), (oxford_dep-dep)].join(',')
    else
      sub_arr1 = @dep_line_rev[(dep_r+1), (oxford_dep_rev-dep_r)].join(',')
    end
    if dest<oxford_dest
      sub_arr2 = (@dest_line[dest, (oxford_dest - dest)]).reverse.join(',')
    else
      sub_arr2 = (@dest_line_rev[dest_r, ((oxford_dest_rev - dest_r)-1)]).reverse.join(',')
    end
    puts sub_arr1 + "," + sub_arr2
    puts "Change line at Oxford Circus."
  end
end

count_stops
