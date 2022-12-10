import 'package:flutter/material.dart';
import 'package:ramene/service/service.dart';
import 'package:ramene/view/login.dart';
import 'models/ramene.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 92, 164),
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins Bold',
            fontSize: 20,
          ),
        ),
      ),
      body: FutureBuilder<List<Data>>(
        future: Service.getDataPaint(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Sedang loading...'));
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(children: [
                        Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.network(
                              "${snapshot.data![index].img}",
                              fit: BoxFit.cover,
                            ) // height: 170,
                            // width: 160,

                            ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              color: Colors.black26,
                              child: Text(
                                '${snapshot.data![index].name}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              color: Colors.black26,
                              child: Text(
                                '${snapshot.data![index].years}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                      ]);
                    }),
              );
            }
          }
        },
      ),
    );
  }
}
