import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseurl = 'http://api.weatherapi.com'; // base url

  Future<WeatherModel> getweather({required String cityname}) async {
    try {
      Response response = await dio.get(
          '$baseurl/v1/forecast.json?key=3ad6b81f03fb4e6d8a3125236232410&q=$cityname&days=1&aqi=no&alerts=no');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String error = e.response?.data['error']['message'] ??
          'oops there was an error try again later';
      throw Exception(error);
    } catch (e) {
      log(e.toString());
      throw Exception('error');
    }
  }
}
