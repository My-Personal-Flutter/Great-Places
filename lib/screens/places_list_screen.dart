import 'package:flutter/material.dart';
import 'package:great_places/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routName);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Center(
          //child: CircularProgressIndicator(),
          ),
    );
  }
}