# **THE FBI FIFTY MOST WANTED**

Welcome to the FBI 50 Most Wanted application! 

This application was built using data from the 2021 FBI 50 most wanted database. This app has been seeded with real information about the crimes, fugitives and locations of the FBI's 50 most wanted.  Upon initialization of this app the user will seed their local database with all of the data . This app was created to help FBI agents read, analyze, input and remove details about crimes, fugitives and locations, correcting formatting and for ease of use.    


<!-- This application will allow the FBI to store, track, alter, and analyze the 50 most wanted criminals and their crimes.This is seeded with data from the FBI's 50 Most Wanted database. application allows FBI agents to read, analyze, input and remove details about crimes, fugitives and locations. All data has been taken from the FBI's public database and has been restructured for a better user story -->

## **Instructions**

1. This app is working with Ruby 2.6.1 ``` rvm install 2.6.1 ```
2. Fork and clone this repository into local environment
3. Run ``` bundle install ``` in your terminal 
4. Run the ``` rake prepare_database ``` to create, migrate and seed your database with data from the FBI database, this will also open being running the application
5. Follow the prompts with your arrow key to get started 
6. If at any time you exit the application run ``` rake enter ``` in your terminal to re-enter the application



## **Main Menu Prompts**

![Welcome to the FBI's 50 most wanted database](images/fbi.jpg)

- **Access Records:** allows users the abilty to access crime and fugitive data or perform a data analysis
   
    - **Access Fugitive Data:** allows users the ability to access data about age, physical features, distinguishing marks, warnings or fugitive status searching by name search, fugitive ID number or location
        - **Data Analysis:** allows users to access data about oldest fugitives, youngest fugitives, most common hair color and the most wanted fugitive
    - **Access Crime Data:** allows users the ability to access information about the description, subject, suspects, reward and date recorded searching by crime ID, fugitive name or location
        - **Most Common Location:** data regarding the most common location of crimes

- **Update Records:** allows users the ability to update crime, fugitive and city information in the database
    - **Update Fugitive Data:** allows users the ability to update or correct any information about a fugitive
    - **Update Crime Data:** allows users the ability to update or correct any information about a crime
    - **Update City Data:** allows users the ability to update or correct a city name

- **Create New Records:** allows users the ability to enter information into the database about a new crime, fugitive or city name 

- **Remove Records:** allows users the ability to remove a crime, fugitive or city from the database


## Many- Through Relationship


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


### Contributors
Abbie Coghlan & Lisa McGerr
