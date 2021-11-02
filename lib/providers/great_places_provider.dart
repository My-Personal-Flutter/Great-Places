import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/models/place_model.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _itemPlaces = [];

  List<Place> get items {
    return [..._itemPlaces];
  }

  void addPlace(String placeName, File imageFile) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: imageFile,
      location: null,
      title: placeName,
    );
    _itemPlaces.insert(0, newPlace);
    notifyListeners();
  }
}
