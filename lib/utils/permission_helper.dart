import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission({required Permission permission}) async {
  final status = await permission.request();
  return status.isGranted;
}

Future<bool> handleLocationPermission() async {
  bool serviceEnabled;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  return serviceEnabled;
}


