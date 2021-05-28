import 'dart:io';
import 'package:path/path.dart';
import 'package:connectivity/connectivity.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();
  factory DBHelper() {
    dbHelper.initDb();
    return dbHelper;
  }
  Future<String> initDb() async {}

  Future<String> mobileConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return 'Điện thoại của bạn đang được kết nối 3G/4G';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return 'Điện thoại của bạn đang được kết nối Wifi';
    }
  }
}
