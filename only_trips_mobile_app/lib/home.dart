import 'package:flutter/material.dart';
import 'package:onlytrips/menudrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> trips = [
    "New York",
    "Russia",
    "Dubai",
    "Qatar",
    "France",
    "Germany"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Only',
              style: TextStyle(
                fontFamily: 'Gotham Light Regular',
                fontSize: 25.0,
              ),
            ),
            Text(
              'Trips',
              style: TextStyle(
                fontFamily: 'Marguerite',
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      drawer: new NavDrawer(),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
                child: Text(
              trips[index],
              style: TextStyle(
                fontFamily: 'Marguerite',
                fontSize: 40.0,
              ),
            )),
          ));
        },
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

// class HomePage extends StatelessWidget {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Only',
//               style: TextStyle(
//                 fontFamily: 'Gotham Light Regular',
//                 fontSize: 25.0,
//               ),
//             ),
//             Text(
//               'Trips',
//               style: TextStyle(
//                 fontFamily: 'Marguerite',
//               ),
//             ),
//           ],
//         ),
//         leading: IconButton(
//           icon: Icon(
//             Icons.menu,
//             semanticLabel: 'menu',
//           ),
//           onPressed: () => _scaffoldKey.currentState.openDrawer(),
//         ),
//       ),
//       drawer: new NavDrawer(),
//       body: Center(
//         // TODO: Make stuff work in the main page
//         child: Text('Landing Page',
//             style: TextStyle(fontFamily: 'Gotham Light Regular')),
//       ),
//       resizeToAvoidBottomInset: false,
//     );
//   }
// }
