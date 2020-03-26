import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:location/location.dart';
import './bloc.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  @override
  LocationState get initialState => InitialLocationState();
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is RequestService) {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          yield ServiceDisabled();
        }
      }
      yield ServiceEnabled();
      this.add(RequestPermission());
    } else if (event is RequestPermission) {
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.DENIED) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.GRANTED) {
          yield PermissionDenied();
        }
      }
      yield PermissionGranted(location);
    }
  }
}
