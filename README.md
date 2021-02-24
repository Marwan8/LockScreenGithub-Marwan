# Android Unlock Pattern on iOS

This task is to Implement an Android Unlock Pattern giving access to 2 pages using VIPER Architecture.

## About VIPER

### Viper Components

Each VIPER module consists of the following parts:

- View (View, ViewController) 
- Interactor (Business Logic, Use Cases) 
- Presenter (Prepare Business logic for presentation in the View)
- Entity (Model) 
- Router (Assemble each module and Take control of Routing)

VIPER architecture allows for a clearer separation of concerns and separates the viewController from handling most of the responsibility in an app. Concerns are separated into modules for each use case.
Each module has a clear layer of routing logic, presentation logic and business logic
												
## About the task App

It is a simple app to present Android unloack pattern screen and after enter the first valid pattern, the user will be able to search using any keyword for list of github users throw there API, by clicking any row, the user will navigate to details screen 

Also, from Android unloack pattern screen, the user will be able to navigate directly to the details screen in case of entering seconed valid pattern 

- You can change the valid patterns from UnlockPatternBuilder.Swift, you can update pageATrack, pageBTrack default values

There are in total 3 VIPER modules.

The UI appearance of this app is currently under construction 😂

## Run
Please run the project using Xcode 12.3
The porject support Swift 5 

## Unit Testing
One advantage of VIPER is that it makes unit testing so much easier!

So, I have add some examples of unit test cases for the presenter

## TODO:
1. Implement more real-life like UI
2. Add more test cases  
3. Save local data using local database (i.e Core Data)
4. Implement UI Testing


# Contact:
marwan.ayman8@gmail.com

