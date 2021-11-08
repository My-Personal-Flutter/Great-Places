import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/models/place_model.dart';
import 'package:great_places/providers/great_places_provider.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routName = "/add-place";

  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _selectedLocaion;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _userPlaceLocation(double lat, double lng) {
    _selectedLocaion = PlaceLocation(longitude: lng, latitude: lat);
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _selectedLocaion == null) {
      return;
    }
    Provider.of<GreatPlacesProvider>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage!,
      _selectedLocaion!,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Add New Place"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: "Title",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ImageInput(
                        pickedImage: _selectImage,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      LocationInput(
                        selectedLocation: _userPlaceLocation,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(26.0),
              child: ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text("Add Place"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
