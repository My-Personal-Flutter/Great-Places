import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:great_places/models/place_model.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _itemPlaces = [];

  List<Place> get items {
    return [..._itemPlaces];
  }

  Future<void> addPlace(
    String placeName,
    File imageFile,
    PlaceLocation pickedLocation,
  ) async {
    // not used because the Api is PAID
    // final address = await LocationHelper.getPlaceAddress(
    //   pickedLocation.latitude!,
    //   pickedLocation.longitude!,
    // );
    final updatedLocation = PlaceLocation(
      longitude: pickedLocation.longitude,
      latitude: pickedLocation.latitude,
      address: "Mandi Bahauddin",
    );

    final newPlace = Place(
      id: DateTime.now().toString(),
      image: imageFile,
      location: updatedLocation,
      title: placeName,
    );

    _itemPlaces.insert(0, newPlace);

    notifyListeners();

    DBHelper.insert('Places', {
      'id': newPlace.id!,
      "title": newPlace.title!,
      "image": newPlace.image!.path,
      "loc_lat": newPlace.location!.latitude!,
      "loc_lng": newPlace.location!.longitude!,
      "address": newPlace.location!.address!,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getAllData("Places");
    _itemPlaces = dataList
        .map(
          (item) => Place(
            id: item["id"],
            image: File(item["image"]),
            title: item["title"],
            location: PlaceLocation(
              latitude: item["loc_lat"],
              longitude: item["loc_lng"],
              address: item["address"],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
