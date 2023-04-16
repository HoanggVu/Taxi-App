import 'package:doantaxi/src/resources/Widgets/home_menu.dart';
import 'package:doantaxi/src/resources/Widgets/search_add.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            GoogleMap(initialCameraPosition: CameraPosition(
              target: LatLng(10.7915178, 106.7271422),
              zoom: 14.4746,
            ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Text(
                      "Taxi App",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: TextButton(
                      onPressed: () {
                        _scaffoldkey.currentState?.openDrawer();
                      },
                      child: Image.asset("assets/ic_menu.png"),
                    ),
                    actions: <Widget>[
                      Image.asset("assets/ic_notify.png"),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 20, top: 20, right: 20), child: SearchAdd(),)
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );
  }
}
