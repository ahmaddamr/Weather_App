import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherStates {}

class WeatherLoading extends WeatherStates {}

class NoWeatherState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherErrorState extends WeatherStates {
  final String errormsg;

  WeatherErrorState(this.errormsg);
}

//=======================================================

// class WeatherCubit extends Cubit<WeatherStates> {
//   WeatherCubit(this.weatherService) :super(NoWeatherState());
//   WeatherService weatherService ;
//   WeatherModel? weatherModel ;
//   void getcubit()
//   async{
//     emit(state);
//     try {
//       weatherModel = await weatherService.getweather(cityname: cityname);
//       emit(state);
//     } on Exception catch (e) {
//       emit(state);
//     }
    
//   }
  
// }

