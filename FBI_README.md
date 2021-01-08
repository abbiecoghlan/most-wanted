# 2021 FBI 50 Most Wanted App

Welcome to the 2021 FBI's 50 Most Wanted app! This application allows FBI agents to read, analyze, input and remove details about crimes, fugitives and locations. All data has been taken from the FBI's public database and has been restructured for a better user story

## Instructions

1. This app is working with Ruby version 2.6.1
2. Fork and clone this repository into your terminal 
3. Run 'bundle install' in your terminal
4. Run the following commands to create and seed your database with FBI data
    - 'rake db:create'
    - 'rake db:migrate'
    - 'rake db:seed'
5. When you are ready enter the app run 'ruby bin/run.rb' in your terminal 
6. Follow the prompts with your arrow key to get started 

## Main Menu Prompts

- Access Records - FBI agents are able to access crime and fugitive data or perform a data analysis

- Update Records - FBI agents are able to update crime, fugitive and city data in the database. 
    - Correct spelling, alter record or adding missing record

- Create New Records - FBI agents are able to enter new crimes, fugitives and cities into the database.

- Remove Records - FBI agents are able to remove crimes, fugitives and cities from the database