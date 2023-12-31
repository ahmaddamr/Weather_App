import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class Weatherview extends StatelessWidget {
  const Weatherview({super.key});

  @override
  Widget build(BuildContext context) {
    // var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          getWeatherColor(weatherModel.condition),
          getWeatherColor(weatherModel.condition)[300]!,
          getWeatherColor(weatherModel.condition)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.city,
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              Text(weatherModel.date, style: TextStyle(fontSize: 22)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network('https:${weatherModel.image}'),
                  Text(
                    weatherModel.temp.toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        'Maxtemp: ${weatherModel.maxtemp.round()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Mintemp: ${weatherModel.mintemp.round()}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    weatherModel.condition,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

DateTime StringTODateTime(String value) {
  return DateTime.parse(value);
}
