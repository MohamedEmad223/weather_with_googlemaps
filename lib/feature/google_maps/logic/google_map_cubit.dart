import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_with_googlemaps/core/constant/constants.dart';

import '../../home/data/model/weather.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapInitial());


  Set<Marker> markers = {};

  Weather? weather;

  Future<void> getWeather() async {
  if (markers.isEmpty) {
  return;
  }
  final position = markers.first.position;
  emit(GoogleMapLoading());
  try {
    final params = '?q=${position.latitude}, ${position.longitude}';
  final response = await Dio().get(Constants.baseURL + params + Constants.apiKey);
  weather = Weather.fromJson(response.data);
  } catch (e) {
  log(GoogleMapError(e.toString()).toString());
  }
  emit(GoogleMapInitial());
  }

  void selectMarker(LatLng value) {
  markers.add(Marker(
  markerId: const MarkerId('selected_location'),
  position: value,
  ));
  emit(GoogleMapInitial());
  }

  void reset() {
  markers.clear();
  weather = null;
  emit(GoogleMapInitial());
  }

  }


