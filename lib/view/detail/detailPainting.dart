import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/Paintings.dart';
import '../../model/User.dart';

import '../../viewmodel/painting_service.dart';
import '../crud/update.dart';
import '../home/home.dart';
import '../profile/profile.dart';

class DetailPainting extends StatefulWidget {
  final PaintingsModel painting;
  int user;
  Future<List<PaintingsModel>> fetchpainting;
  DetailPainting(
      {Key? key,
      required this.painting,
      required this.user,
      required this.fetchpainting})
      : super(key: key);

  @override
  State<DetailPainting> createState() => _DetailPaintingState();
}

class _DetailPaintingState extends State<DetailPainting> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Update(
                        user: widget.user, panting_id: widget.painting.id),
                  ));
                },
                child: const Icon(
                  Icons.update,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  Dio dio = Dio();

                  var baseUrlApi = PaintingService().baseUrlApi;

                  var responseApi = await dio
                      .delete('$baseUrlApi/paintings/${widget.painting.id}');
                  debugPrint(responseApi.data.toString());

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(user: widget.user)));
                },
                child: const Icon(
                  Icons.delete,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: FutureBuilder<List<PaintingsModel>>(
        future: widget.fetchpainting,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("${widget.painting.name}",
                                    style:
                                        Theme.of(context).textTheme.headline6),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Artist : ${widget.painting.artist}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49)),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Year : ${widget.painting.year}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 395,
                      height: 470,
                      child: Image.network(
                        widget.painting.cover,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "${widget.painting.description}",
                        style: Theme.of(context).textTheme.bodyText1,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
