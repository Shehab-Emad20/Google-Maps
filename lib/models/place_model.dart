import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng lat;

  PlaceModel({required this.id, required this.name, required this.lat});
}

List<PlaceModel> place = [
  PlaceModel(
    id: 1,
    name: 'Cairo',
    lat: LatLng(30.050320237433272, 31.370212213398904),
  ),
  PlaceModel(
    id: 2,
    name: 'Minya',
    lat: LatLng(28.129084127619905, 30.926770727654898),
  ),
  PlaceModel(
    id: 3,
    name: 'Alexandria',
    lat: LatLng(31.25828502126786, 30.381707234761233),
  ),
];
