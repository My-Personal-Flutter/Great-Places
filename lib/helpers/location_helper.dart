import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = "AIzaSyBIEIpsvj068L_WIFzR7Un7GrE4HBR9L8k";

class LocationHelper {
  // not used because the Static Map Api is not working PAID
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return "https://maps.googleapis.com/maps/api/staticmap?"
        "center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&"
        "markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY";
  }

  // not used because the Adcress Map Api is not working PAID
  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY";
    final response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
