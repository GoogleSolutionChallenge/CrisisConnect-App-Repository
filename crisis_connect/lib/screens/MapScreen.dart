import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as places;
import 'package:location/location.dart' as location;
import 'package:location/location.dart';

// adding a marker to the user location
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final LatLng _initialcameraposition = const LatLng(53.5461, 113.4937);
  late GoogleMapController _controller;

  final location.Location _location = location.Location();

  late double _latitude = 53.5461;

  late double _longitude = 113.4937;

  late final Map<String, Marker> _markers = {};

  final places.GoogleMapsPlaces _places = places.GoogleMapsPlaces(apiKey: 'AIzaSyA7guPDiP0D6f8QD-gm-Oxc-mOLVcDpijQ');

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((location.LocationData l) {
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
              myLocationEnabled: true,
              markers: _markers.values.toSet(),
              onMapCreated: _onMapCreated,
            ),
          ],
        ),
      ),
    );
  }
}
