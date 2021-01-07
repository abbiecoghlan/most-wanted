require "pry"

class CLI 

    def user_input
        gets.chomp
    end


    def run
        clear_screen
        puts "You are entering the FBI's 50 most wanted database"
        puts ""
        main_menu
    end 

    def main_menu
        prompt = TTY::Prompt.new
        my_menu = prompt.select("Please select from the following options:") do |menu|
            menu.choice 'Access Records'
            menu.choice 'Update Records'
            menu.choice 'Create New Records'
            menu.choice 'Delete Records'
        end 
        
        case my_menu
        when "Access Records" 
            access_records
        when "Update Records"
            update_records
        when "Create New Records"
            create_new_records
        when "Delete Records"
            delete_records
        end
    end


    def access_records
        clear_screen
        prompt = TTY::Prompt.new
        access_menu = prompt.select("Please select from the following options:",%w(Access_fugitive_data Access_crime_data Main_menu))
        
        case access_menu
        when "Access_fugitive_data"
            fugitive_data
        when "Access_crime_data"
            crime_data
        when "Main_menu"
            main_menu
        end 

    end 

    
    def fugitive_data
        clear_screen
        prompt = TTY::Prompt.new
        menu = prompt.select("Please select from the following options:",%w(Find_by_name Find_by_location Oldest_fugitive Youngest_fugitive Average_age Most_common_hair_color Most_wanted Main_menu))
        case menu
        when "Find_by_name"
            print "Enter name: "
            input = user_input
            found_fugitive = Fugitive.find_by(name: input.upcase)
            if !found_fugitive 
                puts "Fugitive not found, verify spelling."
            else
                found_fugitive.print_data
            end

        when "Find_by_location"
            print "Enter location: "
            input = user_input
            found_city = City.find_by(name: input.downcase.gsub(/\s/,""))
            if !found_city
                puts "City not found, verify spelling."
            else 
                found_fugitives = found_city.fugitives
                found_fugitives.map {|fugitive| fugitive.print_data}
            end   
        when "Oldest_fugitive"
            puts "The oldest fugitive currently in our database is: "
            Fugitive.oldest_fugitive.print_data      
        when "Youngest_fugitive"
            puts "The youngest fugitive currently in our database is: "
            Fugitive.youngest_fugitive.print_data      
        when "Average_age"
            puts "The average age of the fugitives in our database is #{Fugitive.average_age}."
        when "Most_common_hair_color"
            puts "The most common hair color for fugitives in our database is: #{Fugitive.most_common_hair_color}."
        when "Most_wanted"
            puts "The most wanted fugitive in our database is: "
            Fugitive.all.first.print_data
        when "Main_menu"
            main_menu
        end
    end 

    def crime_data
        clear_screen
        prompt = TTY::Prompt.new
        menu = prompt.select("Please select from the following options:",%w(Find_by_fugitive Find_by_city Most_common_location Main_menu))
        case menu
        when "Find_by_fugitive"
            print "Enter name: "
            input = user_input
            found_fugitive = Fugitive.find_by(name: input.upcase)
            if !found_fugitive 
                puts "Fugitive not found, verify spelling."
            else
                puts "#{input} is wanted for the following crimes:"
                found_crimes = Crime.all.select {|crime| crime.fugitive_id == found_fugitive.id}
                found_crimes.map {|crime| crime.print_data}
            end
        when "Find_by_city" 
            print "Enter city name: "
            input = user_input
            found_city = City.find_by(name: input.downcase.gsub(/\s/,""))
            if !found_city 
                puts ""
                puts "City not found, verify spelling."
            else
                puts ""
                puts "The follow crimes were found in #{input}:"
                puts ""
                found_crimes = Crime.all.select {|crime| crime.city_id == found_city.id}
                found_crimes.map {|crime| crime.print_data}
            end
        
        when "Most_common_location"
            puts ""
            puts "The most common location where crimes in our databased have occured is #{Crime.most_common_location.capitalize()}."
            puts ""
        when "Main_menu"
            main_menu
        end 

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
        prompt = TTY::Prompt.new
        my_menu = prompt.select("Locate fugitive record by:") do |menu|
            menu.choice 'Name'
            menu.choice 'Id'
        end 
        
        case my_menu
        when "Name" 
            print "Enter name to locate fugitive record: "
            input = user_input.upcase
            entry = Fugitive.find_by(name: input)
        when "Id"
            print "Enter ID to locate fugitive record: "
            input = user_input.strip.to_i
            entry = Fugitive.find(input)
        end

        if !entry 
            puts "Fugitive not located."
        else 
            entry.print_data
            prompt = TTY::Prompt.new
            update_menu = prompt.select("Select category to update:") do |menu|
                menu.choice 'Name'
                menu.choice 'Alias'
                menu.choice 'Age'
                menu.choice 'Hair color'
                menu.choice 'Eye color'
                menu.choice 'At large?'
                menu.choice 'Gender'
                menu.choice 'Warning'
                menu.choice 'Scars and marks'
                menu.choice 'Main menu'
            end

            case update_menu
            when 'Name'
                puts "Fugitive name was previously recorded as #{entry.name.downcase.capitalize()}."
                print "Please enter new name: "
                input = user_input.upcase
                entry.update(name: input)
                puts "Name has been updated to #{entry.name.downcase.capitalize()}."
            when 'Alias'
                puts "Fugitive alias was previously recorded as #{entry.alias.downcase.capitalize()}."
                print "Please enter an additional alias: "
                input = user_input.downcase
                aliases = "#{entry.alias}, #{input}."
                entry.update(alias: aliases)
                puts "Alias has been updated to #{entry.alias.downcase.capitalize()}."
            when 'Age'
                puts "Fugitive age was previously recorded as #{entry.age}."
                print "Please enter new age: "
                input = user_input.to_i
                entry.update(age: input)
                puts "Age has been updated to #{entry.age}."
            when 'Hair color'
                puts "Fugitive hair color was previously recorded as #{entry.hair_color.downcase.capitalize()}."
                print "Please enter new hair color: "
                input = user_input.downcase
                entry.update(hair_color: input)
                puts "Hair color has been updated to #{entry.hair_color.downcase.capitalize()}."
            when 'Eye color'
                puts "Fugitive's eye color was previously recorded as #{entry.eye_color.downcase.capitalize()}."
                print "Please enter new eye color: "
                input = user_input.downcase.capitalize()
                entry.update(eye_color: input)
                puts "Eye color has been updated to #{entry.eye_color.downcase.capitalize()}."
            when 'At large?'
                # puts "Suspect is still at large"

            when 'Gender'
                puts "Fugitive gender was previously recorded as #{entry.gender.downcase.capitalize()}."
                print "Please enter new gender: "
                input = user_input.downcase.capitalize()
                entry.update(gender: input)
                puts "Gender has been updated to #{entry.gender.downcase.capitalize()}."

            when 'Warning'
                puts "Fugitive warning was previously recorded as #{entry.warning}."
                print "Please enter new warning: "
                input = user_input.upcase
                entry.update(warning: input)
                puts "Warning has been updated to #{entry.warning}."

            when 'Scars and marks'
                puts "Fugitive scars and marks were previously recorded as #{entry.scars_and_marks.downcase.capitalize()}."
                print "Please enter additional scars and marks: "
                input = user_input.downcase
                scars = "#{entry.scars_and_marks}, #{input}."
                entry.update(scars_and_marks: scars)
                puts "Scars and marks have been updated to #{entry.alias.downcase.capitalize()}."

            when 'Main menu'
                main_menu
            end 
        


        end 

        # entry.update


     end 


    # def update_crime
    #     prompt = TTY::Prompt.new
    #     my_menu = prompt.select("Locate fugitive record by:") do |menu|
    #         menu.choice 'Name'
    #         menu.choice 'Id'
    #     end 
    # end 

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
        fugitive_new = Fugitive.new
        puts "Enter fugitive name: "
        fugitive_new.name = gets.chomp.upcase
        puts "Enter fugitive alias: "
        fugitive_new.alias = gets.chomp
        puts "Enter fugitive age: "
        fugitive_new.age = gets.chomp.to_i
        puts "Enter fugitive hair color: "
        fugitive_new.hair_color = gets.chomp.downcase
        puts "Enter fugitive eye color: "
        fugitive_new.eye_color = gets.chomp.downcase.capitalize()
        fugitive_new.at_large = true
        puts "Enter fugitive gender: "
        fugitive_new.gender = gets.chomp.downcase.capitalize()
        puts "Enter fugitive warning: "
        fugitive_new.warning = gets.chomp.upcase
        puts "Enter fugitive scars and marks: "
        fugitive_new.scars_and_marks = gets.chomp.downcase.capitalize()

        fugitive_new.save
        puts "Fugitive has been saved to database, fugitive_id is : #{fugitive_new.id}. "
    end 

    def new_crime
        crime_new = Crime.new
        puts "Enter fugitive ID: "
        crime_new.fugitive_id = gets.chomp.strip.to_i
        puts "Enter city ID: "
        crime_new.city_id = gets.chomp.strip.to_i
        puts "Enter description: "
        crime_new.description = gets.chomp
        puts "Enter subject: "
        crime_new.subject = gets.chomp
        puts "Enter reward: "
        crime_new.reward = gets.chomp

        crime_new.save
        puts "Crime has been saved to database, crime_id is : #{crime_new.id}."
    end 

    def new_city
        city_new = City.find_or_create_by(name: gets.chomp.downcase.gsub(/\s+/, ""))
        puts "City_id is #{city_new.id}. "
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
        puts "Enter fugitive_id to delete fugitive data: "
        input = gets.chomp.strip.to_i
        Fugitive.all.find(input).destroy
        puts "Fugitive has been removed from the database."
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