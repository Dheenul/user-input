import 'package:flutter/material.dart';
import 'package:pop_up/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:pop_up/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:pop_up/Pages/HomeScreen/HomeScreenVM.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

// Create a screen named HomeScreen using satateful widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // Create state for the screen HomeScreen
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Create an instance named _homeScreenVM for the class HomeScreenVM.
  final HomeScreenVM _homeScreenVM = HomeScreenVM();

  // Create a controller named _nameController for the input text feild that gets names as input.
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {

    // Using Super keyword call the parent initState method.
    super.initState();

    // Listen to the stream using the stream controller named navigationStream using instance _homeScreenVM.
    _homeScreenVM.navigationStream.stream.listen((event) {

      // Check whether the listened event is equal to NavigatorPop
      if (event is NavigatorPop) {
        
        // Using context.pop() navigate to the prevoius page.
        context.pop();
      }
    });
  }

  @override
  void dispose() {
    // Dispose the TextEditingController using .dispose method.
    _nameController.dispose();

    // Using instance named _eventDetailsVM close the stream using .close() method.
    _homeScreenVM.dispose();

    // call the parent dispose method.
    super.dispose();
  }

  /* Create a method named showPopUp of type void with a required parameter named index.*/
  void showPopUp({required int index}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Icons.person_2_rounded),
            actionsAlignment: MainAxisAlignment.center,
            title: Text(
              'Name in the list is... ',
              style: GoogleFonts.aBeeZee(),
            ),
            content:

                // Build a text widget using value in the list named collectionOfNames at the particular index.
                Text(
              _homeScreenVM.collectionOfNames[index],
              style: GoogleFonts.aBeeZee(),
            ),
            actions: [
              ElevatedButton.icon(
                  onPressed: () {

                    // Using the instance _homeScreenVM call the method navigateToPreviousPage.
                    _homeScreenVM.navigateToPreviousScreen();
                  },
                  icon: const Icon(Icons.close),
                  label: Text(
                    "close pop up",
                    style: GoogleFonts.aBeeZee(),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text(
          'Pop up...',
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              style: GoogleFonts.aBeeZee(),

              // Assing the instance created for the TextEditingController for controller parameter.
              controller: _nameController,
              decoration: InputDecoration(
                helperText: 'Please enter your full name in the above input field',
                prefixIcon: const Icon(Icons.person),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                constraints:
                    const BoxConstraints(maxHeight: 100, maxWidth: 330),
                label: Text(
                  "Name",
                  style: GoogleFonts.aBeeZee(),
                ),
                hintText: 'Enter your name.',
                hintStyle: GoogleFonts.aBeeZee(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              onPressed: () {

                // Using the instance _homeScreenVM call the method onClickOfAddNameButton and pass the value 
                //from the input field using the controller as the parameter value.
                _homeScreenVM.onClickOfAddNameButton(
                    userInput: _nameController.text);
              },
              child: Text(
                'Add Name',
                style: GoogleFonts.aBeeZee(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'List of added names...',
              style: GoogleFonts.aBeeZee(),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(thickness: 1, indent: 30, endIndent: 30,),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (context) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  // Iterate till the length of the list named collectionOfNames.
                  itemCount: _homeScreenVM.collectionOfNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      leading: const Icon(Icons.person),
                      title: 
                      
                      // Build a text widget using value in the list named collectionOfNames at the particular index.
                      Text(
                        _homeScreenVM.collectionOfNames[index],
                        style: GoogleFonts.aBeeZee(),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showPopUp(index: index);
                        },
                      ),
                    );
                  });
            })
          ],
        ),
      )),
    ));
  }
}
