# **THE FBI FIFTY MOST WANTED**

<img width="437" alt="FBI Logo" src="https://user-images.githubusercontent.com/73184313/104023303-10d8a380-5187-11eb-85cb-b19eb2dd6343.png">


Welcome to the FBI 50 Most Wanted CLI! 

This project was created by two students attending Flatiron School's software engineering immersive as their end of module one project. In this application, we redesign the FBI's most wanted database in order to create an application that allows our user, an FBI agent, to read, analyze, input, update and remove information about fugitives and their crimes in various cities across the US. To get started, we seed our application with real-time data from the FBI's open API, allowing our application access to current information about the FBI's most wanted criminals.


## **Models and Users**
The user in our application is an FBI agent. In future versions of our program, functionality could be expanded to include citizens who might want to use the application to access crime data or report infomation and tips to the FBI regarding fugitives that are at large.

Our application utilizes the following models:

- **Fugitive:** a fugitive has many crimes, and has many cities through crimes 
- **City:** a city can have many crimes, and has many fugitives through crimes
- **Crime:** crimes belongs to a city and fugitive 


## **Instructions**

1. This app is working with Ruby 2.6.1 ``` rvm install 2.6.1 ```
2. Fork and clone this repository into local environment
3. Run ``` bundle install ``` in your terminal 
4. Run the ``` rake prepare_database ``` to create, migrate and seed your database with data from the FBI database, this will also being running the application
5. Follow the prompts with your arrow key to get started, additionally you will need to use your keyboard to a 
6. If at any time you exit the application run ``` rake enter ``` in your terminal to re-enter the application



## **Menu Prompts**

![Welcome to the FBI's 50 most wanted database.](https://user-images.githubusercontent.com/73184313/104022455-ecc89280-5185-11eb-8483-c73971045781.jpg)

- **Access Records:** allows users the abilty to access crime and fugitive data or perform a data analysis
   
    - **Access Fugitive Data:** allows users the ability to access data about age, physical features, distinguishing marks, warnings or fugitive status using a name, fugitive ID number or location
        -**Data Analysis:** allows users to access data about oldest fugitives, youngest fugitives, most common hair color and the most wanted fugitive
    - **Access Crime Data:** allows users the ability to access information about the description, subject, reward and date recorded using a crime ID, fugitive name or location
        - **Most Common Location:** data regarding the most common location of crimes

<img width="328" alt="Fugitive record iD 38 was located:
Name: LEI GAO
Aliases: 'Jason'
Age: 
Hair color: black
Eye color: brown
Gender: Male
Scars and marks:
Status: Suspect is at large
Warning: SHOULD BE CONSIDERED AN ESCAPE RISK
" src="https://user-images.githubusercontent.com/73184313/104024522-dd971400-5188-11eb-862c-d2a72bb3577c.png"> 

- **Update Records:** allows users the ability to update crime, fugitive and city information in the database
    - **Update Fugitive Data:** allows users the ability to update or correct any information about a fugitive
    - **Update Crime Data:** allows users the ability to update or correct any information about a crime
    - **Update City Data:** allows users the ability to update or correct a city name

- **Create New Records:** allows users the ability to enter information into the database about a new crime, fugitive or city name 

- **Remove Records:** allows users the ability to remove a crime, fugitive or city from the database





<!-- To do
- the premise of the project is create an FBI database moving forward
- create photo file with screenshots from applicaion
- go into detail about methods and 
- database is seeded with data from 

 ‘rake prepare_database’ will create, migrate, seed, and start the app

‘rake enter’ will let them enter the app again if they exit

FBI data to seed data
FBI agent - user stories -->

### Resources
https://api.fbi.gov/docs#!/Wanted/get_wanted

### Contributors
Abbie Coghlan & Lisa McGerr

The FBI have no affiliation to this application. Their public database has been used to create an application for educational purposes only.
