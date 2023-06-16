import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_vcare/Screens/Country/countryController.dart';
import 'package:task_vcare/Screens/home/homeScreen.dart';
import 'package:task_vcare/models/country.dart';

class CountryListScreen extends StatelessWidget {
  final CountryController _countryController = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        centerTitle: true,
        title: Text('Country List'),
      ),
      body: Obx(
        () => _countryController.countries.isNotEmpty
            ? ListView.builder(
                itemCount: _countryController.countries.length,
                itemBuilder: (context, index) {
                  final Country country = _countryController.countries[index];

                  return ListTile(
                    leading: Image.network(
                      country.flagUrl,
                      width: 50,
                      height: 30,
                    ),
                    title: Text(country.name),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
