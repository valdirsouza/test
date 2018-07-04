=begin
Hey! This is my very first CRUD application 
on ruby made by myself (on my own!!!)!


Kind of a create, read, update and delete system of league of legends' champions.
At first it will only hold these two information:
1 - champion name
2 - AP or AD base
***improve continue


=end
champs = {}
def insert(champs)
	continue = true
	while  continue
		print "Name your champion: "
		champ = gets.chomp.capitalize

		print "AP or AD: "
		base = gets.chomp.upcase
		while base != 'AP' && base != 'AD'
			print "Please, type 'AP' or 'AD' only: "
			base = gets.chomp.upcase
		end

		champs[champ] = base
		puts "Done!"

		print "Insert a new champion? Y or N: "
		input = gets.chomp.downcase
		while input != "y" && input != 'n'

			print "Type only Y or N: "
			input = gets.chomp.downcase

		end

		if input == "y"
			continue = true
		else		
			continue = false
		end

	end
end

def search(champs)
	print "Type the name of your champion: "
	key = gets.chomp.downcase
	result = champs.select {|k, v| k.downcase == key}
	if result != {}
		result
	else
		false
	end


end

def update(champs)
	#print "Type the name of your champion: "
	#champ = gets.chomp
	champTemp  = search(champs)
	
	if champTemp != false
		print "New value: "
		newValue = gets.chomp
		champTemp.each do |champ, value|
			champs[champ] = newValue.upcase
		end
	else
		puts "Error! Not updated."
	end
end

def list(champs)
	if champs != {}
		champs.each {|k, v| puts "#{k} -> #{v}"}
	else
		puts "List's empty!"
	end
end

def delete(champs)
	#print "Type the name of the cham you want to delete: "
	#champ = gets.chomp
	champTemp = search(champs)
	if champTemp != false
		champTemp.each do |champ, value| 
		champs.delete(champ)
		puts "Done!"
		end
	else
		puts "Error! Not found!"
	end

end

repeat = true
#champs = {'a' => 'aa', 'b' => 'bb'}
#p champs
while repeat
	def options
		puts ""
		puts "Hey, choose one option"
		puts ""
		puts "Type 'I' to insert a champion"
		puts "Type 'U' to update a champion"
		puts "Type 'S' to search a champion"
		puts "Type 'L' to list champions"
		puts "Type 'D' to delete a champion"
		puts "-- Or type 'E' to exit -- "

		menuInput = gets.chomp.downcase

	end

	def repeat?()
		print "Go back to menu? Type Y or N: "
		input = gets.chomp.downcase
		repeat = repeat
		while input != 'y' && input != 'n'
			print "Please, only Y or N: "
			input = gets.chomp.downcase
			if input == 'y'
				puts input== 'y'
				puts repeat
				repeat = true
			else
				repeat = false
			end
			
		end
		
		return repeat = true if input == 'y'
		return repeat = false if input == 'n'
	end

	choice = options

	
	case choice
		when "i"
			puts "-- Insert --"
			insert(champs)
			repeat = repeat?
		when "u"
			puts "-- Update --"			
			update(champs)

			repeat = repeat?

		when "s"
			puts "-- Search --"
			
			result = search(champs)
			if result != false 
				result.each {|k, v| puts "#{k} -> #{v}"}
			else
				puts "Not found!"
			end
			repeat = repeat?

		when "l"
			puts "-- List --"
			list(champs)
			repeat = repeat?

		when "d"
			puts "-- Delete --"
			delete(champs)
			repeat = repeat?
		when "e"
			break
		else
			puts "Please, choose!"
			#repeat = true
		end
	
end
