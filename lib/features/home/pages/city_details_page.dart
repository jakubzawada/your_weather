import 'package:flutter/material.dart';
import 'package:your_weather/models/weather_model.dart';
import 'package:your_weather/widgets/city_details_container.dart';
import 'package:your_weather/widgets/weather_details_container.dart';

class CityDetailsPage extends StatelessWidget {
  final WeatherModel weatherModel;

  const CityDetailsPage({Key? key, required this.weatherModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/mapa.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                CityDetailsContainer(weatherModel: weatherModel),
                const SizedBox(height: 100),
                WeatherDetailsContainer(weatherModel: weatherModel)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
