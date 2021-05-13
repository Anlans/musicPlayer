import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';

class DioUtil {
  static DioUtil _instance;
  static DioUtil getInstance() {
    if (_instance == null) {
      _instance = DioUtil();
    }
    return _instance;
  }

  Dio dio = new Dio();

  DioUtil() {
    dio.options.baseUrl = "http://121.199.50.169:3000";
    dio.options.connectTimeout = 2000000;
    dio.options.receiveTimeout = 4000000;

    getTemporaryDirectory().then((tempDir) {
      CookieJar cj = new PersistCookieJar(storage: FileStorage(tempDir.path));
      dio.interceptors.add(CookieManager(cj));
    });
  }

  get(String url, params, Function successCallBack,
      Function errorCallBack) async {
    try {
      Response response =
          await dio.get(url, queryParameters: params).catchError(errorCallBack);
      final data = response.data;
      if (data['code'] == 200) {
        successCallBack();
      } else {
        errorCallBack(data);
      }
    } catch (e) {
      errorCallBack(e);
    }
  }

  post(String url, params) async {
    // print(successCallBack);
    return await dio.post(url, data: params);
  }
}
