# Mobile Applications I Project 6
# CurrencyConverter Application

## Description
CurrencyConverter is a simple application designed to convert amounts from USD to selected currencies. This project utilizes concepts learned in Module 6, focusing on creating a multiview application with segues for navigation and implementing a user-friendly interface for currency conversion.

## Features
1. **User Input**: Users can enter the amount in USD using a UITextField.
2. **Error Handling**: An error message is displayed on a label if the user enters invalid input (non-integer value).
3. **Currency Selection**: Users can select up to four different currencies (Yen, Pesos, Euros, and Won) using UISwitch.
4. **Conversion**: Upon selecting currencies and initiating conversion, the application navigates to a new ViewController via segue and displays the converted amounts on labels.
5. **MVC Pattern**: The application is refactored using the MVC (Model-View-Controller) pattern for organized code structure.

## Requirements
- Create a multiview application and use segue to navigate between ViewControllers.
- Provide a UITextField for users to enter amount in USD. Integer only. Show error message on a label for invalid user input.
- Allow users to select up to four different currencies (Yen, Pesos, Euros, and Won) using UISwitch. Navigate to a new ViewController using segue and display converted currencies on labels.
- Refactor your application using MVC pattern.
- The application should run for all size classes, including iPads, and for the landscape orientation.

## Implementation Details
- Clone or download the project from the provided GitHub repository.
- Explore the implementation of multiview application architecture with segues for navigation.
- Examine how user input validation and error handling are implemented.
- Understand the logic behind currency conversion and how the selected currencies are displayed on the subsequent ViewController.
- Learn about the MVC pattern and how it separates concerns for better maintainability.

## Usage
To use the CurrencyConverter application:
1. Open the application on your iOS device or simulator.
2. Enter the amount in USD using the provided UITextField.
3. Select up to four different currencies (Yen, Pesos, Euros, and Won) using UISwitch.
4. Initiate the conversion process.
5. Navigate to the next ViewController to view the converted amounts.
6. Explore the application's functionality and interface for an intuitive currency conversion experience.

## Requirements
- The application is designed to run for all size classes, including iPads, and supports landscape orientation.
