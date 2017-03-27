require "yaml"

def save_as(serialized_obj)
   print "Save as?"
   filename = gets.chomp + ".yml"
   Dir.chdir(Dir.pwd+"/saved_games") do
     while(File.exist?("#{filename}"))
     	print "This file already exists. Save as?"
     	filename = gets.chomp + ".yml"
   	 end
   	 f = File.new("#{filename}","w")
   	 f.write(serialized_obj)
   end
   puts "#{filename} successfully saved."
end

def save(filename, serialized_obj)
	while(true)
	   print "Overwrite existing file(y/n)? "
	   input = gets.chomp.downcase
	   if input == "y"
	   	  break
	   elsif input == "n"
	   	  save_as(serialized_obj)
	   	  return
	   end	
	end
   Dir.chdir(Dir.pwd+"/saved_games") do
   		File.open("#{filename}","w") { |f| f.puts serialized_obj}
   end
   puts "#{filename} successfully overwritten."
end

def get_filename
	Dir.chdir(Dir.pwd+"/saved_games") do
	    while(true)
		  	print "Enter filename(e.g. game1) : "
			filename = gets.chomp+".yml"
			if File.exist?("#{filename}")
				return filename
			else
				puts "\nFile not found.\n   Enter 1 : New Game\n   Enter 2 : Try again"
	            if get_valid_response(gets.chomp) == "1"
	               	return nil
	            end
			end
	    end
   end
end
def load_game(filename)
	yaml = 0
	Dir.chdir(Dir.pwd+"/saved_games") do
	    out = File.open("#{filename}","r")
		yaml = YAML::load(out)
    end
    yaml
end

def get_valid_response(input)
	while(input!="1" && input!="2")
	    print "Invalid. Please enter 1 or 2: "
	    input = gets.chomp
	end
	input
end