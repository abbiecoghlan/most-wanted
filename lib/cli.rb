def greet
    puts 'You are entering the FBI 50 most wanted database'
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


