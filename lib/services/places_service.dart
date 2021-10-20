import 'package:http/http.dart' as http;
import 'package:login_page/models/place.dart';

import 'dart:convert' as convert;




class PlacesService {
  final key = 'AIzaSyDV7DKcBinMBpjILVoC83RTcb3kqsICATE';
  static String? place = 'atm';
  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=$place&rankby=distance&key=$key'));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}