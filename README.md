# SeniorPal

A flutter app which provides various useful utilites to the elderly.

## About

The purpose of this app is to be an "assistant" for senior citizens which provides certain functions such as medicine management, emergency contacts management and breathing exercises. The app has been made with accessibility for senior citizens in mind. The UI is intuitive and easy on the eyes.

## Features

* Medicine Management:
      This page lets the user add/remove medicine cards which display the name of the medicine and the dosage. The icon will change depending on the type of medicine           (syrup or pills).
      
* Emergency Contacts:
      This page lets the user add, remove or search for emergency contacts. If the user swipes left on the contact, the delete option appears. 
      
* Breathing Exercises:
      A ring to showcase progress is displayed. When the user clicks on the button, they are prompted to breathe in, hold their breath, and then slowly breathe out. The         progress is visible on the ring.
      
## Technologies Used:

Sqlalchemy- Facilitates communication between the Python program and database.
Fast-API- Used to create accounts, login and authenticate as well as send an SMS when forgot password is clicked on.
Flutter- Used to create all the major functionalities of the app like Medication Reminder, Emergency Calling as well as Breathing Exercise along with the overall design of the app.

## Setting up the backend:

To set up the backend, the user needs to have Python installed. Then, do the following: 

create virtual env venv using pip
activate venv using "./venv/Scripts/activate" in terminal
use "pip freeze requirements.txt" to install dependencies
run server using "uvicorn main:app --reload" 

## Permissions:

The app requires Internet access.
