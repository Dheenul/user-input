import 'package:mobx/mobx.dart';
import 'package:pop_up/Helpers/AppNavigations/NavigationMixin.dart';
part 'HomeScreenModel.g.dart';

// Create a class named EventDetailsModel.
class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel, NavigationMixin;

abstract class _HomeScreenModelBase with Store {

  // Create a observable List of type string named collectionOfNames
  @observable
  List<String> collectionOfNames = [];

  /* Create a method named setDataToCollectionOfNames of type void which has a required named parameter that takes list as a input.  */ 
  @action
  void setDataToCollectionOfNames({required List<String> names}) {

    // Empty the list named collectionOfNames.
    collectionOfNames = [];

    // Assign the list named names to the list named collectionOfNames
    collectionOfNames = names;
  }
}
