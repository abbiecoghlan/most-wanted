class CLI 

    def run
        clear_screen
        puts "You are entering the FBI's 50 most wanted database"
        main_menu
    end 

    def main_menu
        prompt = TTY::Prompt.new
        menu = prompt.select("Please select from the following options:",%w(Access_records Update_records Create_new_records Delete_records))
        case menu
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
        clear_screen
        prompt = TTY::Prompt.new
        access_menu = prompt.select("Please select from the following options:",%w(Access_fugitive_data Access_crime_data Access_city_data Main_menu))
        
        case access_menu
        when "Access_fugitive_data"
            fugitive_data
        when "Access_crime_data"
            crime_data
        when "Access_city_data"
            city_data
        when "Main_menu"
            main_menu
        end 

    end 

    def fugitive_data
    end 

    def crime_data
    end 

    def city_data
    end 
   
    def update_records
        clear_screen
        prompt = TTY::Prompt.new
        update_menu = prompt.select("Please select from the following options:",%w(Update_fugitive_data Update_crime_data Update_city_data Main_menu))

        case update_menu
        when "Update_fugitive_data"
            update_fugitive
        when "Update_crime_data"
            update_crime        
        when "Update_city_data"
            update_city
        when "Main_menu"
            main_menu
        end 

    end 

    def update_fugitive
    end 

    def update_crime
    end 

    def update_city
    end 


    def create_new_records
        clear_screen
        prompt = TTY::Prompt.new
        create_menu = prompt.select("Please select from the following options:",%w(Add_fugitive Add_crime Add_city Main_menu))

        case create_menu
        when "Add_fugitive"
            new_fugitive
        when "Add_crime"
            new_crime
        when "Add_city"
            new_city
        when "Main_menu"
            main_menu
        end 
    end 

    def new_fugitive
    end 

    def new_crime
    end 

    def new_city
    end 

    def delete_records
        clear_screen
        prompt = TTY::Prompt.new
        delete_menu = prompt.select("Please select from the following options:",%w(Delete_fugitive Delete_crime Delete_city Main_menu))

        case delete_menu
        when "Delete_fugitive"
            delete_fugitive
        when "Delete_crime"
            delete_crime
        when "Delete_city"
            delete_city
        when "Main_menu"
            main_menu
        end 
    end 

    def delete_fugitive
    end 

    def delete_crime
    end 

    def delete_city
    end

    # menu = prompt.select("Please select from the following options:",%w(Access_fugitive_records Access_crime_data Update_fugitive_records Update_crime_data )


    # def run
    #     puts "Enter a name to access a fugitive record:"
    #     input = gets.chomp.upcase
    #     selection = Fugitive.find_by(name: input)
    #     puts "Fugitive name: #{selection.name}"
    #     puts "Fugitive age: #{selection.age}"
    #     puts "Fugitive alias: #{selection.alias}"
    # end 

    def clear_screen
        system "clear"
    end

end 