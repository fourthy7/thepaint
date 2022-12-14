import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/User.dart';
import '../view/crud/post.dart';
import '../view/crud/update.dart';
import '../view/home/home.dart';
import '../view/profile/profile.dart';
import 'drawer.dart';

class TabsController extends StatelessWidget {
  // final UserModel user;
  int user;
  var Tab1, Tab2, Tab3;
  TabsController(
      {required this.Tab1,
      required this.Tab2,
      required this.Tab3,
      required this.user});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'PAINTINGS',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Poppins Bold',
              fontSize: 20,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'Semua',
              ),
              Tab(
                text: 'PC',
              ),
              Tab(
                text: 'Mobile',
              )
            ],
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Post(user: user),
                    ));
                  },
                  child: const Icon(
                    Icons.add_box_outlined,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        drawer: DrawerWidget(
          user: user,
        ),
        body: TabBarView(
          children: <Widget>[Tab1, Tab2, Tab3],
        ),
      ),
    );
  }
}
