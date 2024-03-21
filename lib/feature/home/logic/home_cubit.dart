import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_with_googlemaps/core/constant/constants.dart';
import 'package:weather_with_googlemaps/feature/home/data/model/weather.dart';

import '../../../core/location_utils/location_utils.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Weather? weather;

  Future<void> getlocation() async{
    final position = await LocationUtils.getCurrentLocation();
    if(position == null){
      emit(HomeError('Location not found'));
      return;
    }
    try{

      final params = '?q=${position.latitude}, ${position.longitude}';

      final response = await Dio().get('${Constants.baseURL}$params&key=${Constants.apiKey}');
      final data = response.data;
      weather = Weather.fromJson(data);

    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
