import 'package:pop_up/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:pop_up/Pages/HomeScreen/HomeScreenModel.dart';

// Create a class named HomeScreenVM by extending the class HomeScreenModel
class HomeScreenVM extends HomeScreenModel {

  /* Create a method named onClickOfAddNameButton of type void to get the data from input field and add it to the list.*/
  void onClickOfAddNameButton({required String userInput}) {

    // Check whether the userInput is not equal to empty string.
    if (userInput != "") {

      // Using .add method add the parameter userInput's value into the list called collectionOfNames.
      collectionOfNames.add(userInput);
    }

    // Call the method named setDataToCollectionOfNames and pass the list named collectionOfNames for the parameter named named names
    setDataToCollectionOfNames(names: collectionOfNames);
  }

  /* Create a method navigateToPreviousScreen of type void to navigate to previous page. */
  void navigateToPreviousScreen() {
    
    // Using the stream controller named navigationStream add the NavigatorPop event into the stream.
    navigationStream.add(NavigatorPop());
  }
}
