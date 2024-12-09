# Movie Explorer App

## Overview
Movie Explorer App is a Flutter-based application that provides users with a seamless way to browse trending movies, search for specific titles, and view detailed movie information. Built with state management using Bloc, the app adheres to clean architecture principles and best practices for maintainable code.

## Features
- **Trending Movies ( HOME SCREEN )**: View a list of trending movies with dynamic pagination and this screen is considered as home screen for the app.
- **Search Functionality**: Search for movies by title in real-time in the home screen.
- **Detailed Information**: Display detailed information about each movie, including posters and ratings.
- **Error Handling**: Inform users of any errors with retry functionality.
- **Responsive Design**: Optimized UI for various screen sizes.

## Technologies Used
- **Flutter**: For building the cross-platform user interface.
- **Bloc**: For state management and business logic.
- **The Movie Database (TMDb) API**: To fetch movie data.

## Installation Using CLI :

1. Clone the repository:
   
   git clone https://github.com/mabedamro/movies_task.git
   
2. Navigate to the project directory:
  
   cd movies_task


3. Install dependencies:
 
   flutter pub get


4. Run the app:
  
   flutter run


## Folder Structure
```
lib/
|-- src/
    |-- app/
        |-- app_colors.dart
    |-- features/
        |-- home/
            |-- data/
                |-- home_bloc/
                    |-- home_bloc.dart
                    |-- home_event.dart
                    |-- home_state.dart
                |-- repo/
                    |-- home_repo.dart
            |-- models/
                |-- movie.dart
            |-- view/
                |-- home_page.dart
                |-- widgets/
                    |-- movie_card.dart
                    |-- movie_info.dart
                    |-- movie_poster.dart
        |-- movie_details/
            |-- data/
                |-- details_bloc/
                    |-- details_bloc.dart
                    |-- details_event.dart
                    |-- details_state.dart
                |-- repo/
                    |-- details_repo.dart
            |-- models/
                |-- genre.dart
                |-- movie_details_model.dart
                |-- production_company.dart
                |-- production_country.dart
                |-- spoken_lang.dart
            |-- view/
                |-- details_page.dart
                |-- widgets/
                    
    |-- core/
        |-- api/
            |-- end_points.dart
        |-- utils/
            |-- constants.dart
```

## How to Use

1. **Home Page**: Launch the app to view a list of trending movies. Scroll to load more movies dynamically.
2. **Search**: Use the search bar at the top to find specific movies.
3. **Retry on Error**: If an error occurs, tap the retry button to fetch data again.
4. **Click on movie item**: If you click on the movie item in the list that will open a new page called details page to view the movie details.

## Configuration
- Register for a TMDb API key [here](https://www.themoviedb.org/settings/api).
- Update the API key in `constants.dart`:
  ```dart
  const String apiKey = 'YOUR_API_KEY'; //  my API-KEY = a5ab363e677990594c15ff2d53d3ffa9
  ```
## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
For any questions or suggestions, feel free to contact [mabedamro@gmail.com].

