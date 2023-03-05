import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as places;
import 'package:location/location.dart' as location;
import 'package:location/location.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final LatLng _initialcameraposition = const LatLng(53.5461, 113.4937);
  late GoogleMapController _controller;

  final location.Location _location = location.Location();

  Set<Marker> _markers = {};
  final places.GoogleMapsPlaces _places = places.GoogleMapsPlaces(apiKey: 'AIzaSyA7guPDiP0D6f8QD-gm-Oxc-mOLVcDpijQ');

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((location.LocationData l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!),zoom: 15),
        ),
      );
    });
  }

  Future<void> _performSearch(String query) async {
    final LocationData location = await _location.getLocation();
    final places.PlacesSearchResponse result = await _places.searchByText(query, location: places.Location(lat: location.latitude!, lng: location.longitude!));

    if (result.status == "OK") {
      // Create markers for each hospital result
      final markers = result.results.map((place) => Marker(
        markerId: MarkerId(place.id!),
        position: LatLng(place.geometry?.location.lat ?? 0, place.geometry?.location.lng ?? 0),
        infoWindow: InfoWindow(title: place.name ?? ''),
      ));


      // Update map markers with search results
      setState(() {
        _markers = Set<Marker>.of(markers);
      });
    } else {
      print("Error: ${result.errorMessage}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(target: _initialcameraposition, zoom: 14),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: _markers,
            ),
          ],
        ),
      ),
    );
  }
}
