import 'package:flutter/material.dart';
import 'package:thepaint/constant/constant.dart';
import '../../model/Paintings.dart';
import '../../model/User.dart';
import '../../navigator/tab.dart';
import '../../viewmodel/painting_service.dart';
import '../detail/detailPainting.dart';

class Home extends StatefulWidget {
  // final UserModel user;
  int user;
  Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  var lastIndex;

  @override
  Widget build(BuildContext context) {
    Widget tabSemua = FutureBuilder<List<PaintingsModel>>(
      future: PaintingService().fetchDataPainting(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container(
                color: white,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: snapshot.data!.length,
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPainting(
                                          painting: snapshot.data![index],
                                          user: widget.user,
                                          fetchpainting: PaintingService()
                                              .fetchDataPainting(),
                                        )));
                          },
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "${snapshot.data![index].cover}"),
                                      )),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "${snapshot.data![index].name}",
                                style: TextStyle(
                                  color: lightGrey,
                                  fontFamily: 'Poppins Light',
                                ),
                              ),
                            ],
                          ));
                    }));
          }
        }
      },
    );

    Widget tab1 = FutureBuilder<List<PaintingsModel>>(
      future: PaintingService().fetchDataPaintingArtist("Leonardo da Vinci"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container(
                color: white,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: snapshot.data!.length,
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPainting(
                                          painting: snapshot.data![index],
                                          user: widget.user,
                                          fetchpainting: PaintingService()
                                              .fetchDataPaintingArtist(
                                                  "Leonardo da Vinci"),
                                        )));
                          },
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "${snapshot.data![index].cover}"),
                                      )),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "${snapshot.data![index].name}",
                                style: TextStyle(
                                  color: lightGrey,
                                  fontFamily: 'Poppins Light',
                                ),
                              ),
                            ],
                          ));
                    }));
          }
        }
      },
    );

    Widget tab2 = FutureBuilder<List<PaintingsModel>>(
      future: PaintingService().fetchDataPaintingArtist("Mobile"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container(
                color: white,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: snapshot.data!.length,
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPainting(
                                          painting: snapshot.data![index],
                                          user: widget.user,
                                          fetchpainting: PaintingService()
                                              .fetchDataPaintingArtist(
                                                  "Michelangelo"),
                                        )));
                          },
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "${snapshot.data![index].cover}"),
                                      )),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "${snapshot.data![index].name}",
                                style: TextStyle(
                                  color: lightGrey,
                                  fontFamily: 'Poppins Light',
                                ),
                              ),
                            ],
                          ));
                    }));
          }
        }
      },
    );

    return TabsController(
      Tab1: tabSemua,
      Tab2: tab1,
      Tab3: tab2,
      user: widget.user,
    );
  }
}
