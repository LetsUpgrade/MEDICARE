import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderMedicine extends StatefulWidget {
  OrderMedicine({Key key, this.title}) : super(key:key);

  final String title;

  @override
  _OrderMedicineState createState() => _OrderMedicineState();
}

class _OrderMedicineState extends State<OrderMedicine> {
  GoogleMapController _controller;

  final CameraPosition _initialPosition = CameraPosition(target: LatLng(24.903623,67.198367));
  final List<Marker> markers = [];

  addMarker(cordinate){
    setState(() {
      int id = Random().nextInt(100);
      markers.add((Marker(position: cordinate, markerId: MarkerId(id.toString()) )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        onMapCreated: (controller){
          setState(() {
            _controller = controller;
          });
        },
        markers: markers.toSet(),
        onTap: (cordinate){
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker((cordinate));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ),
    );
  }
}