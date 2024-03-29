import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function? selectedLocation;

  const LocationInput({Key? key, this.selectedLocation}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImage;

  void _showPreview(double lat, double lng) {
    // not used because the Static Map Api is PAID
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: lat,
      longitude: lng,
    );
    setState(() {
      _previewImage = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      print(locData.latitude);
      print(locData.longitude);

      _showPreview(locData.latitude!, locData.longitude!);
      widget.selectedLocation!(
        locData.latitude,
        locData.longitude,
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> _seletecOnMap() async {
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => const MapScreen(
          isSelecting: true,
        ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    _showPreview(
      selectedLocation.latitude,
      selectedLocation.longitude,
    );
    widget.selectedLocation!(
        selectedLocation.latitude, selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: _previewImage == null
              ? const Text(
                  "No location choosen",
                  textAlign: TextAlign.center,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/images/my_location.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  // not used because the Static Map Api is not working
                  // Image.network(
                  //   _previewImage!,
                  //   fit: BoxFit.cover,
                  //   width: double.infinity,
                  // ),
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: const Icon(Icons.location_on),
              label: const Text("Current Location"),
            ),
            TextButton.icon(
              onPressed: _seletecOnMap,
              icon: const Icon(Icons.map),
              label: const Text("Slelect on Map"),
            ),
          ],
        )
      ],
    );
  }
}
