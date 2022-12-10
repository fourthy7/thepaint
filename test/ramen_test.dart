// 1. install package dio terlebih dahulu, dan import ke sini
import 'dart:convert';
import 'package:dio/dio.dart';

// 2. menggunakan asyncronous untuk ambil data api
Future<void> main() async {
  // 3. inisasikan sebuah package Dio
  Dio dio = Dio();

  /* 4. variable dio dapat diakses berbagai method salah 
  satunya get untuk mengambil data dari http request */
  var response = await dio
      .get('https://my-does-app-5c4a7-default-rtdb.firebaseio.com/ramene.json');
  print('status code : ${response.statusCode}');
  var dataResponse = response.data;
  // 5. Cek hasil response
  print(dataResponse);

// soal 1
  print("Soal Nomor 1 \n");
  // tampilkan message / pesan dari response yang didapat
  // clue dataResponse[..]
  print("Message : " + dataResponse['message'] + "\n");

  // soal 2
  print("Soal Nomor 2 \n");
  // tampilkan semua data dari response yang didapat
  // tidak termasuk message / pesan
  // clue dataResponse[..]
  print("Data : " + dataResponse['data'].toString() + "\n");

  // soal 3
  print("Soal Nomor 3 \n");
  // tampilkan data pada urutan pertama saja
  // clue dataResponse[..][..]
  print("Data pertama " + dataResponse['data'][0].toString() + "\n");

  // soal 4
  print("Soal Nomor 4 \n");
  // tampilkan tulisan Hot Lava Ramene
  // clue dataResponse[..][..][..]
  print(
      "Data Hot Lava : " + dataResponse['data'][0]['product_name'].toString());
}