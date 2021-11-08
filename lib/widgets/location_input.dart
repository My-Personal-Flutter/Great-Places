import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImage;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
    // not used because the Static Map Api is not working PAID
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );
    setState(() {
      _previewImage = staticMapImageUrl;
    });
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
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text("Slelect on Map"),
            ),
          ],
        )
      ],
    );
  }
}
