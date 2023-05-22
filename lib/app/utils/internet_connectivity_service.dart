import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {
  Future<bool> hasActiveInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return Future<bool>.value(true);
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return Future<bool>.value(true);
    }
    return Future<bool>.value(false);
  }
}
