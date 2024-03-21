part of 'google_map_cubit.dart';

sealed class GoogleMapState {}

final class GoogleMapInitial extends GoogleMapState {}

final class GoogleMapLoading extends GoogleMapState {}

final class GoogleMapError extends GoogleMapState{
  final String message;

  GoogleMapError(this.message);
}
