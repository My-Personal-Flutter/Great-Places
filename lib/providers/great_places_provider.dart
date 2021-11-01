import 'package:flutter/material.dart';
import 'package:great_places/models/place_model.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _itemPlaces = [];

  List<Place> get items {
    return [..._itemPlaces];
  }
}
