import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> isConnected() async {
    List<ConnectivityResult> result = await Connectivity().checkConnectivity();
    var data = [
      ConnectivityResult.mobile,
      ConnectivityResult.wifi,
      ConnectivityResult.bluetooth
    ];
    bool isConnected = result.any((e) => data.contains(e));
    return isConnected;
  }
}
