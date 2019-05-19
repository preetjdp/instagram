import 'dart:async';

import 'package:backdrop/twopanels.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<Null> main() async {

  cameras = await availableCameras();

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
        textTheme: TextTheme(title: TextStyle(color: Colors.black))),
    home: new BackdropPage(),
  ));
}

class BackdropPage extends StatefulWidget {
  @override
  _BackdropPageState createState() => _BackdropPageState();
}

class _BackdropPageState extends State<BackdropPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: new Color(0xfff8faf8),
        elevation: 0.0,
        centerTitle: true,
        title: SizedBox(
          height: 35.0,
          child: Image.asset("assets/images/insta_logo.png"),
        ),
        leading: new IconButton(
          color: Colors.black,
          onPressed: () {
            controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
          },
          icon: new AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: controller.view,
          ),
        ),
      ),
      body: new TwoPanels(
        cameras,
        controller: controller,
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: new BottomAppBar(
            child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            new IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
            ),
            new IconButton(
              icon: Icon(Icons.add_box),
              onPressed: null,
            ),
            new IconButton(
              icon: Icon(Icons.favorite),
              onPressed: null,
            ),
            new IconButton(
              icon: Icon(Icons.account_box),
              onPressed: null,
            )
          ],
        )),
      ),
    );
  }
}
