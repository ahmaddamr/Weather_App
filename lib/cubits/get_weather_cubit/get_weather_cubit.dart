import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(NoWeatherState());

  WeatherModel? weatherModel;
  getWeathercubit({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await WeatherService().getweather(cityname: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
