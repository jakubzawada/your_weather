import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_weather/app/core/enums.dart';
import 'package:your_weather/features/home/pages/city_details_page.dart';
import 'package:your_weather/features/home/pages/cubit/home_cubit.dart';
import 'package:your_weather/repositories/weather_repository.dart';
import 'package:your_weather/widgets/city_search_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        WeatherRepository(),
      ),
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state.status == Status.success) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CityDetailsPage(
                  weatherModel: state.model!,
                ),
              ),
            );
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Select a city'),
                centerTitle: true,
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/globus.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Builder(builder: (context) {
                    if (state.status == Status.loading) {
                      return const CircularProgressIndicator();
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CitySearchTextField(),
                      ],
                    );
                  }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
