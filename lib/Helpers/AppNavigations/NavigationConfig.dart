// ignore_for_file: constant_identifier_names, file_names, non_constant_identifier_names


import '../../Pages/HomeScreen/HomeScreen.dart';
import 'NavigationHelpers.dart';

// Declare the Routes as Enum and give pages name of our application.
enum Routes {
  HomeScreen,
}

// Create class named Pages which holds the pages in the application 
class Pages{ 
   
  // Create page configuration named homeScreenConfig for the page named HomeScreen and pass values to the parameter route and build.
  static final PageConfig homeScreenConfig = PageConfig(route: Routes.HomeScreen , build: (_) => HomeScreen());
}