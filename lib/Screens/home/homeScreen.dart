import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task_vcare/Screens/Country/countryListScreen.dart';

import 'homeScreenController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final HomeScreenController _mapController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Map Screen'),
        centerTitle: true,
      ),
      body: Obx(
        () => GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _mapController.currentLocation.value ?? LatLng(0, 0),
            zoom: 15,
          ),
          markers: {
            if (_mapController.currentLocation.value != null)
              Marker(
                markerId: const MarkerId('currentLocation'),
                position: _mapController.currentLocation.value!,
                infoWindow: const InfoWindow(title: 'Current Location'),
              ),
          },
          onMapCreated: (controller) {
            _mapController.mapController = controller;
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CountryListScreen()),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
