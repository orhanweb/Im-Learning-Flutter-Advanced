import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

typedef NetworkCallback = void Function(NetworkStation result);

abstract class INetworkChangeManager {
  Future<NetworkStation> checkNetworkFirstInit();
  void handleNetworkChange(NetworkCallback onChange);
  void dispose();
}

class NetworkChangeManager extends INetworkChangeManager {
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;
  NetworkChangeManager() {
    _connectivity = Connectivity();
  }
  @override
  Future<NetworkStation> checkNetworkFirstInit() async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    return NetworkStation.checkConnectivityResult(connectivityResult);
  }

  @override
  void handleNetworkChange(NetworkCallback onChange) {
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      onChange.call(NetworkStation.checkConnectivityResult(event));
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}

enum NetworkStation {
  on,
  off;

  static NetworkStation checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
      case ConnectivityResult.other:
        return NetworkStation.on;
      case ConnectivityResult.none:
        return NetworkStation.off;
    }
  }
}
