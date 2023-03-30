import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as location;
import 'package:google_api_headers/google_api_headers.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late LatLng _initialcameraposition = const LatLng(53.5461, 113.4937);
  late GoogleMapController _controller;

  late CameraPosition? cameraPosition;
  final location.Location _location = location.Location();

  late double _latitude = 53.5461;

  late double _longitude = 113.4937;

  late final Map<String, Marker> _markers = {};

  String kGoogleApiKey = "AIzaSyA7guPDiP0D6f8QD-gm-Oxc-mOLVcDpijQ";

  final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: 'AIzaSyA7guPDiP0D6f8QD-gm-Oxc-mOLVcDpijQ');

  String _tempLocation = "Search Location";

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((location.LocationData l) async {
      _latitude = l.latitude!;
      _longitude = l.longitude!;
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );

      setState(() {
        final marker = Marker(
          markerId: const MarkerId("Current Location"),
          position: LatLng(_latitude, _longitude),
          infoWindow: const InfoWindow(
            title: "Your Current Location",
          ),
        );
        _markers["Current Location"] = marker;
      });
    });
  }

  Future<void> findLocation(String type)  async {
    String response = await getPlaceQueryAutoComplete(type, kGoogleApiKey, 100000, _latitude, _longitude);
    Map<String,dynamic> DataForHospitals = json.decode(response);
    //print(response);
    List<String> list_place_ids = [];
    List<String> list_hospitals = [];
    for (int i = 1; i < DataForHospitals["predictions"].length; i++) {
      if (DataForHospitals["predictions"][i]["place_id"] != null) {
        list_place_ids.add(DataForHospitals["predictions"][i]["place_id"]);
        list_hospitals.add(DataForHospitals["predictions"][i]["description"]);
      }
    }
    List<String> DataForCoordinates = await getPlaceQueryGeocode(list_place_ids, kGoogleApiKey);

    setState(() {
      for (int i = 0; i < DataForCoordinates.length; i++) {
        Map<String, dynamic> data = json.decode(DataForCoordinates[i]);
        print(data);
        LatLng coordinates = LatLng(
            data["results"][0]["geometry"]["location"]["lat"],
            data["results"][0]["geometry"]["location"]["lng"]);
        String location_address = list_hospitals[i];

        final marker = Marker(
          markerId: MarkerId("$type$i"),
          position: coordinates,
          infoWindow: InfoWindow(
            title: location_address,
          ),
        );
        _markers["$type$i"] = marker;
      }
    });

  }

  Future<List<String>> getPlaceQueryGeocode(List<String> list_of_place_ids, String apiKey) async {
    List<String> list_of_coordinates = [];
    for (int i = 0; i < list_of_place_ids.length; i++) {
      String place_id = list_of_place_ids[i];
      var url = Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?place_id=$place_id&key=$apiKey');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        list_of_coordinates.add(response.body);
      } else {
        throw Exception(
            'Request failed with status: ${response.statusCode}. Error message: ${response.body}');
      }
    }
    return list_of_coordinates;
  }

  Future<String> getPlaceQueryAutoComplete(String search, String apiKey, int radius, double lat, double lng) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/queryautocomplete/json?input=$search&language=en&rankby=distance&key=$apiKey&location=$lat,$lng&radius=$radius');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
          'Request failed with status: ${response.statusCode}. Error message: ${response.body}');
    }
  }

  void clearMarkers() {
    _markers.clear();
    setState(() {
      final marker = Marker(
        markerId: const MarkerId("Current Location"),
        position: LatLng(_latitude, _longitude),
        infoWindow: const InfoWindow(
          title: "Your Current Location",
        ),
      );
      _markers["Current Location"] = marker;
    });
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
              initialCameraPosition: CameraPosition(
                target: _initialcameraposition,
                zoom: 14,
              ),
              mapType: MapType.normal,
              myLocationEnabled: true,
              markers: _markers.values.toSet(),
              onMapCreated: _onMapCreated,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        clearMarkers();
                        await findLocation('Hospital');
                      },
                      child: Text('Hospital'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        clearMarkers();
                        await findLocation('Police Station');
                      },
                      child: Text('Police Station'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        clearMarkers();
                        await findLocation('Fire Station');
                      },
                      child: Text('Fire Station'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        clearMarkers();
                        await findLocation('Food Bank');
                      },
                      child: Text('Food Bank'),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      )
    );
  }
}