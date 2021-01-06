class CLI 

    def run
        clear_screen
        puts "You are entering the FBI's 50 most wanted database"
        main_menu
    end 

    def main_menu
        prompt = TTY::Prompt.new
        menu = prompt.select("Please select from the following options:",%w(Access_records Update_records Create_new_records Delete_records))
        case selection
        when "Access_records" 
            access_records
        when "Update_records"
            update_records
        when "Create_new_records"
            create_new_records
        when "Delete_records"
            delete_records
        end 
    end

    def access_records
        prompt = TTY::Prompt.new
        access_menu = prompt.select("Please select from the following options:",%w(Access_fugitive_data Access_crime_data Access_city_data Main_menu))
    end 

    def update_records
    end 


    def create_new_records
    end 

    def delete_records
    end 

    # menu = prompt.select("Please select from the following options:",%w(Access_fugitive_records Access_crime_data Update_fugitive_records Update_crime_data )


    # def run
    #     puts "Enter a name to access a fugitive record:"
    #     input = gets.chomp.upcase
    #     # binding.pry
    #     selection = Fugitive.find_by(name: input)
    #     puts "Fugitive name: #{selection.name}"
    #     puts "Fugitive age: #{selection.age}"
    #     puts "Fugitive alias: #{selection.alias}"
    # end 

    def clear_screen
        system "clear"
    end

end 