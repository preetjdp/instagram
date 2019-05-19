import 'package:backdrop/camera_screen.dart';
import 'package:backdrop/insta_list.dart';
import 'package:flutter/material.dart';

class TwoPanels extends StatefulWidget {
  var cameras;
  final AnimationController controller;

  TwoPanels(this.cameras, {this.controller});

  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> {
  static const header_height = 32.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPanelHeight = height - header_height;
    final frontPanelHeight = -header_height;

    return new RelativeRectTween(
            begin: new RelativeRect.fromLTRB(
                0.0, backPanelHeight, 0.0, frontPanelHeight),
            end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(new CurvedAnimation(
            parent: widget.controller, curve: Curves.linear));
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);

    return new Container(
        child: new Stack(
      children: <Widget>[
        new Container(
            // color: Colors.blueAccent,
            child: CameraScreen(widget.cameras)
            //     child: new Text(
            //   "Back Panel",
            //   style: new TextStyle(fontSize: 24.0, color: Colors.white),
            // )
            ),
        new PositionedTransition(
          rect: getPanelAnimation(constraints),
          child: new Material(
              elevation: 12.0,
              // borderRadius: new BorderRadius.only(
              //     topLeft: new Radius.circular(16.0),
              //     topRight: new Radius.circular(16.0)),
              child: new Column(
                children: <Widget>[
                  new Container(
                      height: header_height,
                      child: new Center(
                          child: new Text(
                        "<PREET/>",
                        style: Theme.of(context).textTheme.button,
                      ))),
                  new Expanded(child: InstaList())
                ],
              )),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: bothPanels);
  }
}
