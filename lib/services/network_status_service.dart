import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

enum NetworkStatus { Online, Offline }

class NetworkStatusService {
  StreamController<NetworkStatus> networkStatusController =
      StreamController<NetworkStatus>();
  StreamController<NetworkStatus> connectivityStreamController =
      StreamController<NetworkStatus>();
  final List<AddressCheckOptions> DEFAULTADDRESSES =
      List<AddressCheckOptions>.unmodifiable([
    AddressCheckOptions(
      InternetAddress('2001:4860:4860::8888',
          type: InternetAddressType.IPv6), // Google
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('2001:4860:4860::8844',
          type: InternetAddressType.IPv6), // Google
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('2606:4700:4700::64',
          type: InternetAddressType.IPv6), // CloudFlare
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('2606:4700:4700::6400',
          type: InternetAddressType.IPv6), // CloudFlare
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('2620:119:35::35',
          type: InternetAddressType.IPv6), // OpenDNS
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('2620:119:53::53',
          type: InternetAddressType.IPv6), // OpenDNS
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
  ]);

  NetworkStatusService() {
    // DataConnectionChecker().addresses = DEFAULTADDRESSES;

    DataConnectionChecker().onStatusChange.listen((dataConnectionEvent) {
      print('This is the Data Connection Status $dataConnectionEvent');
      connectivityStreamController
          .add(_dataConnectionStatus(dataConnectionEvent));
    });
    // Connectivity().onConnectivityChanged.listen((status) {
    //   networkStatusController.add(_getNetworkStatus(status));
    //   print('This is the Status of Network $status');
    // });
  }
  NetworkStatus _dataConnectionStatus(DataConnectionStatus status) {
    return status == DataConnectionStatus.connected
        ? NetworkStatus.Online
        : NetworkStatus.Offline;
  }
  // NetworkStatus _getNetworkStatus(ConnectivityResult status) {
  //   return status == ConnectivityResult.mobile ||
  //           status == ConnectivityResult.wifi
  //       ? NetworkStatus.Online
  //       : NetworkStatus.Offline;
  // }
}
