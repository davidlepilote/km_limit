import 'package:meta/meta.dart';

@immutable
abstract class LocationEvent {}

class RequestService extends LocationEvent {}

class RequestPermission extends LocationEvent {}

