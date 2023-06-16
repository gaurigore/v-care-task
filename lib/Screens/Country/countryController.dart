import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_vcare/models/country.dart';

class CountryController extends GetxController {
  RxList<Country> countries = <Country>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCountryData();
  }

  void fetchCountryData() async {
    try {
      final response = await http.get(
          Uri.parse('https://restcountries.com/v3.1/all?fields=name,flags'));

      if (response.statusCode == 200) {
        final List<dynamic> countriesData = jsonDecode(response.body);

        final List<Country> countryList = countriesData.map((countryData) {
          final countryName = countryData['name']['common'];
          final capital = countryData['capital'];
          final flagUrl = countryData['flags']['png'];

          return Country(
            name: countryName,
            flagUrl: flagUrl,
          );
        }).toList();

        countries.value = countryList;
      } else {
        print('Failed to fetch countries. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching countries: $e');
    }
  }
}
