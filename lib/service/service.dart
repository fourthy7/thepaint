import 'package:dio/dio.dart';

import '../models/ramene.dart';

class Service {
// 2. menggunakan asyncronous untuk ambil data api
//  static Future<Map<String, dynamic>> getDataRamene() async {
//   // 3. inisasikan sebuah package Dio
//   Dio dio = Dio();

//   /* 4. variable dio dapat diakses berbagai method salah
//   satunya get untuk mengambil data dari http request */
//   var response = await dio.get(
//       'https://my-does-app-5c4a7-default-rtdb.firebaseio.com/ramene.json');
//   print('status code : ${response.statusCode}');
//   var dataResponse = response.data;

//   return dataResponse;
// }

  static Future<List<Data>> getDataPaint() async {
    // 3. inisasikan sebuah package Dio
    Dio dio = Dio();

    /* 4. variable dio dapat diakses berbagai method salah
  satunya get untuk mengambil data dari http request */
    var response = await dio.get('http://localhost:3000/Gambar');
    print('status code : ${response.statusCode}');
    // var dataResponse = response.data;
    List<Data> paints =
        (response.data['data'] as List).map((v) => Data.fromJson(v)).toList();

    return paints;
  }
}
