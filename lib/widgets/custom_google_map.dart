import 'package:flutter/material.dart';
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
    super.initState();
  }

  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          // cameraTargetBounds: CameraTargetBounds(
          //   LatLngBounds(
          //     southwest: LatLng(28.090419923469916, 30.72814288964462),
          //     northeast: LatLng(28.087163900621068, 30.7690412142497),
          //   ),
          // ),
          initialCameraPosition: initialCameraPostion,
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("change location"),
          ),
        ),
      ],
    );
  }
}

//world view 0 -> 3
// country view 4 -> 6
// city view 10 -> 12
// street view 13 -> 17
// building view 18 -> 20
