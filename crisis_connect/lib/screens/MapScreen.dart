import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MyAppState();
}

class Location {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<CameraPosition> getLocation() async {
    Position position = await getCurrentLocation();
    return CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 10.0,
    );
  }

  Future<double> getLatitude() async {
    Position position = await getCurrentLocation();
    return position.latitude;
  }

  Future<double> getLongitude() async {
    Position position = await getCurrentLocation();
    return position.longitude;
  }
}

class _MyAppState extends State<MapScreen> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  late Future<CameraPosition> _location;

  @override
  initState() {
    super.initState();
    _location = Location().getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: FutureBuilder<CameraPosition>(
          future: _location,
          builder: (BuildContext context,
              AsyncSnapshot<CameraPosition> snapshot) {
            if (snapshot.hasData) {
              return GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: snapshot.data!,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
