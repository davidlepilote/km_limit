import 'package:location/location.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LocationState {}

class InitialLocationState extends LocationState {}

class ServiceDisabled extends LocationState {}

class ServiceEnabled extends LocationState {}

class PermissionDenied extends LocationState {}

class PermissionGranted extends LocationState {
  final Location location;

  PermissionGranted(this.location);
}
