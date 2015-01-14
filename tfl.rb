bakerloo = ["ElephantNCastle", "Lambeth North", "Waterloo", "Embankment", 
	"Charing Cross", "Picadilly Circus", "Oxford Circus", "Regent's Park", 
	"Baker Street"]

central = ["Notting Hill Gate", "Queensway", "Lancaster Gate", 
	"Marble Arch", "Bond Street", "Oxford Circus", "Tottenham Court Road", 
	"Holborn", "Chancery Lane"]

victoria = ["Kings Cross", "Euston", "Warren Street", "Oxford Circus", 
	"Green Park", "Victoria", "Pimlico"] 

	puts "Which line are you starting from? Bakerloo, Central or Victoria line?"
	user_input = gets.chomp
	if user_input == "bakerloo"
		puts "Which station are you departing from? You can choose from the 
		following stations:"
		puts bakerloo.join(", ")
	 	departure_station = gets.chomp
	elsif user_input == "central"
		puts "Which station are you departing from? You can choose from the 
		following stations:"
		puts central.join(", ")
		departure_station = gets.chomp
	elsif user_input == "victoria"
		puts "Which stations are you departing from? You can choose from the 
		following stations:" 
		puts victoria.join(", ")
		departure_station = gets.chomp
    else 
    	puts "I don't know this line. Please choose between Bakerloo, Central and 
    	Victoria line."

    end
    
    puts "Which is your destination?"
    destination = gets.chomp

    # stops = 0
    # def count_stops 
    	

    # end
