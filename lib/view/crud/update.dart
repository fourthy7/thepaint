import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/User.dart';
import '../../viewmodel/painting_service.dart';
import '../home/home.dart';

class Update extends StatefulWidget {
  int user, panting_id;
  Update({Key? key, required this.user, required this.panting_id})
      : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController cover = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController artist = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: const Text(
          'UPDATE',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins Bold',
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 23),
            child: Column(
              children: [
                const SizedBox(height: 25),
                TextField(
                  controller: cover,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Cover',
                    hintText: 'Cover',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: name,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Name',
                    hintText: 'Name',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: year,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'year',
                    hintText: 'year',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: artist,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'artist',
                    hintText: 'artist',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: description,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Description',
                    hintText: 'Description',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                    onPressed: () {
                      uploadData();
                    },
                    child: const Text('Submit')),
              ],
            )),
      ),
    );
  }

  uploadData() async {
    Dio dio = Dio();

    var baseUrlApi = PaintingService().baseUrlApi; //Kos

    var years = int.parse(year.text);

    Map<String, dynamic> uploadDataData = {
      'cover': cover.text,
      'name': name.text,
      'year': years,
      'artist': artist.text,
      'description': description.text,
    };
    var responseApi = await dio.patch(
        '$baseUrlApi/paintings/${widget.panting_id}',
        data: uploadDataData);
    debugPrint(responseApi.data.toString());

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Home(user: widget.user)));
  }
}
