import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

main() {
  runApp(MaterialApp(home: MyGoogleMap()));
}

class MyGoogleMap extends StatefulWidget {
  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  var la1;
  var lo1;

  runfun() async {
    var p = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    la1 = p.latitude;
    lo1 = p.longitude;
    print(p);
  }

  @override
  Widget build(BuildContext context) {
    var cp = CameraPosition(
      target: LatLng(la1, lo1),
      zoom: 19,
      tilt: 50,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: cp,
        mapType: MapType.hybrid,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: runfun,
        child: Icon(Icons.add),
      ),
    );
  }
}
