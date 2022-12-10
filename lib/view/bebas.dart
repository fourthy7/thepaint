import 'package:flutter/material.dart';
import 'package:ramene/service/ramene_service.dart';

class Bebas extends StatefulWidget {
  const Bebas({Key? key}) : super(key: key);

  @override
  State<Bebas> createState() => _BebasPageState();
}

class _BebasPageState extends State<Bebas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: RameneService.getDataRamen(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Please wait its loading...'));
                } else {
                  if (snapshot.hasError)
                    return Center(child: Text('Error: ${snapshot.error}'));
                  else
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(10),
                          itemCount: snapshot.data?['data'].length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    snapshot.data?['data'][index]['img_url']),
                              ),
                              title: Text(snapshot.data?['data'][index]
                                  ['product_name']),
                            );
                          }),
                    );
                }
                ;
              }),
        ],
      ),
    );
  }
}          
//                       ],
                      
//                         }
//                         );
//                 }

//                 // return Center(
//                 //     child: new Text(
//                 //         '${snapshot.data}')); // snapshot.data  :- get your object which is pass from your downloadData() function
//               }),
//         ],
//       ),
//     );
//   }
// }
