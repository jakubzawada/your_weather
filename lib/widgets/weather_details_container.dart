import 'package:flutter/material.dart';
import 'package:your_weather/models/weather_model.dart';
import 'package:your_weather/widgets/grid_details_element.dart';

class WeatherDetailsContainer extends StatelessWidget {
  const WeatherDetailsContainer({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 72, 158, 216),
              Color.fromARGB(255, 101, 129, 239),
              Color.fromARGB(255, 138, 159, 242),
            ],
            tileMode: TileMode.mirror,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weather details'.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GridDetailsElement(
                  imagePath: 'images/atmospheric.png',
                  text: weatherModel.current.pressureIn.toString(),
                ),
                GridDetailsElement(
                  imagePath: 'images/rainfall.png',
                  text: '${weatherModel.current.precipMm.toString()}mm',
                ),
                GridDetailsElement(
                  imagePath: 'images/humidity.png',
                  text: '${weatherModel.current.humidity.toString()}%',
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GridDetailsElement(
                  imagePath: 'images/cloudy.png',
                  text: '${weatherModel.current.cloud.toString()}%',
                ),
                GridDetailsElement(
                  imagePath: 'images/frhtemperature.png',
                  text: '${weatherModel.current.tempF.toString()}°F',
                ),
                GridDetailsElement(
                  imagePath: 'images/visibility.png',
                  text: '${weatherModel.current.visKm.toString()}km',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
