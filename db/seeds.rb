require 'httparty'

City.delete_all
Crime.delete_all
Fugitive.delete_all

url = "https://api.fbi.gov/@wanted?pageSize=50&page=1&sort_on=modified&sort_order=desc"
response = HTTParty.get(url)
response.parsed_response


response["items"].each do |entry|
    if !entry["aliases"] 
        fugitive_alias = "no known aliases"
    else 
        fugitive_alias = entry["aliases"].join(', ')
    end 

    if !entry["warning_message"] 
        entry["warning_message"] = "SHOULD BE CONSIDERED ARMED AND DANGEROUS"
    end

    fugitive = Fugitive.create(name: entry["title"], alias: fugitive_alias, age: entry["age_min"], hair_color: entry["hair"], eye_color: entry["eyes_raw"], at_large: true, gender: entry["sex"], warning: entry["warning_message"], scars_and_marks: entry["scars_and_marks"])
    
    if !entry["field_offices"] 
        location = nil
    else 
        location = entry["field_offices"].first
    end 


    city = City.find_or_create_by(name: location)

    if !entry["subjects"] 
        subjects = nil
    else 
        subjects = entry["subjects"].first
    end 

    Crime.create(fugitive_id: fugitive.id, city_id: city.id, description: entry["description"].gsub(/\r/, " ").gsub(/\n/,""), subject: subjects, reward: entry["reward_text"])
end







puts "hello"

#rake db:seed to run this file 