class CLI 

    def run
        clear_screen
        puts "You are entering the FBI's 50 most wanted database"
    end 

    prompt = TTY::Prompt.new

    def greet
        puts 
    end

    def main_menu
        puts "Please select from the following options"
    end


    def run
        greet 
        puts "Enter a name to access a fugitive record:"
        input = gets.chomp.upcase
        # binding.pry
        selection = Fugitive.find_by(name: input)
        puts "Fugitive name: #{selection.name}"
        puts "Fugitive age: #{selection.age}"
        puts "Fugitive alias: #{selection.alias}"
    end 

    def clear_screen
        system "clear"
    end

end 