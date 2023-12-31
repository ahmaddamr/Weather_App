import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xffFEAA40),
        title: const Text('Search a City'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
            child: TextField(
          onSubmitted: (value) async {
            // weatherModel =
            // await WeatherService().getweather(cityname: value);
            // log(weatherModel.city);
            // بيخليك ترجع للصفحه ال قبلها
            var getcubit = BlocProvider.of<GetWeatherCubit>(context);
            getcubit.getWeathercubit(cityName: value);
            Navigator.of(context).pop();
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            labelText: 'Search',
            suffixIcon: Icon(Icons.search),
            hintText: 'Enter City Name',
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepOrangeAccent,
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
        )),
      ),
    );
  }
}

