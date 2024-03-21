import 'package:flutter/material.dart';
import 'package:weather_with_googlemaps/feature/google_maps/veiw/screen/google_mapsscreen.dart';

import '../../../../core/location_utils/location_utils.dart';
import '../../../../core/routs/routes.dart';
import 'details_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    LocationUtils.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Get weather from',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => RouteUtils.push(const DetailsScreen()),
              child: const Text("Device Location"),
            ),
            ElevatedButton(
              onPressed: () => RouteUtils.push(const GoogleMapsScreen()),
              child: const Text("Google Map"),
            ),
          ],
        ),
      ),
    );
  }
}