import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetInfo {
  Future<bool> get isConnected;
}

class InternetInfoImpl implements InternetInfo {
  @override
  Future<bool> get isConnected => InternetConnectionChecker().hasConnection;
}
