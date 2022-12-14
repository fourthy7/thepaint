import 'package:dio/dio.dart';

import '../model/Paintings.dart';

import '../model/User.dart';

class PaintingService {
  final String baseUrlApi = "http://192.168.0.123:3000";

  Future<List<PaintingsModel>> fetchDataPainting() async {
    Response response = await Dio().get("$baseUrlApi/paintings");
    List<PaintingsModel> shrimps =
        (response.data as List).map((v) => PaintingsModel.fromJSON(v)).toList();
    return shrimps;
  }

  Future<List<PaintingsModel>> fetchDataPaintingArtist(String artist) async {
    Response response = await Dio().get("$baseUrlApi/paintings?artist=$artist");
    List<PaintingsModel> shrimps =
        (response.data as List).map((v) => PaintingsModel.fromJSON(v)).toList();
    return shrimps;
  }
}
