import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-Time Location Tracker',
      home: LocationTracker(),
    );
  }
}

class LocationTracker extends StatefulWidget {
  @override
  _LocationTrackerState createState() => _LocationTrackerState();
}

class _LocationTrackerState extends State<LocationTracker> {
  late GoogleMapController mapController;
  Position? currentPosition;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final polylinePoints = PolylinePoints();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _startLocationUpdates();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getCurrentLocation() async {
    final hasPermission = await _checkLocationPermission();
    if (!hasPermission) return;

    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng currentLatLng =
    LatLng(currentPosition!.latitude, currentPosition!.longitude);

    setState(() {
      markers.add(Marker(
        markerId: MarkerId('currentLocation'),
        position: currentLatLng,
        infoWindow: InfoWindow(
          title: 'My Current Location',
          snippet:
          '${currentPosition!.latitude}, ${currentPosition!.longitude}',
        ),
      ));
      mapController.animateCamera(CameraUpdate.newLatLngZoom(currentLatLng, 15));
    });
  }

  Future<void> _startLocationUpdates() async {
    Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      LatLng newLatLng = LatLng(position.latitude, position.longitude);

      setState(() {
        polylineCoordinates.add(newLatLng);
        markers.add(Marker(
          markerId: MarkerId('currentLocation'),
          position: newLatLng,
          infoWindow: InfoWindow(
            title: 'My Current Location',
            snippet: '${position.latitude}, ${position.longitude}',
          ),
        ));

        polylines.add(Polyline(
          polylineId: PolylineId('route'),
          points: polylineCoordinates,
          color: Colors.blue,
          width: 5,
        ));
      });

      mapController.animateCamera(CameraUpdate.newLatLng(newLatLng));
    });
  }

  Future<bool> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Location Tracker'),
      ),
      body: currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(
              currentPosition!.latitude, currentPosition!.longitude),
          zoom: 15,
        ),
        markers: markers,
        polylines: polylines,
        myLocationEnabled: true,
      ),
    );
  }
}
