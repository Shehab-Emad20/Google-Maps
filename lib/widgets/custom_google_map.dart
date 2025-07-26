import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPostion;
  @override
  void initState() {
    initialCameraPostion = CameraPosition(
      zoom: 10,
      target: LatLng(28.086989296490174, 30.761086274847088),
    );
    initMarkes();
    super.initState();
  }

  Set<Marker> markes = {};
  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markes,
      onMapCreated: (controller) {
        googleMapController = controller;

        initMapStyle();
      },
      initialCameraPosition: initialCameraPostion,
    );
  }

  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/map_style.json');
    googleMapController.setMapStyle(nightMapStyle);
  }

  Future<Uint8List> getImageFromRawData(String image, double width) async {
    var imageData = await rootBundle.load(image);
    var imageCodec = await ui.instantiateImageCodec(
      imageData.buffer.asUint8List(),
      targetWidth: width.round(),
    );
    var imageFarm = await imageCodec.getNextFrame();
    var imageBaytData = await imageFarm.image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    return imageBaytData!.buffer.asUint8List();
  }

  void initMarkes() async {
    var customMarkerIcons = BitmapDescriptor.bytes(
      await getImageFromRawData(
        'assets/images/map-pin-icon-map-marker-illustration-10-eps-vector.jpg',
        100,
      ),
    );
    var myMarkers =
        place
            .map(
              (e) => Marker(
                infoWindow: InfoWindow(title: e.name),
                icon: customMarkerIcons,
                position: e.lat,
                markerId: MarkerId(e.id.toString()),
              ),
            )
            .toSet();
    markes.addAll(myMarkers);
    setState(() {});
  }

  //world view 0 -> 3
  // country view 4 -> 6
  // city view 10 -> 12
  // street view 13 -> 17
  // building view 18 -> 20
}
