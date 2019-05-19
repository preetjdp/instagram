import 'package:flutter/material.dart';

class InstaStories extends StatelessWidget {
  final topText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text("Stories", style: new TextStyle(fontWeight: FontWeight.bold)),
      new Row(
        children: <Widget>[
          new Icon(Icons.play_arrow),
          new Text("Play All",
              style: new TextStyle(fontWeight: FontWeight.bold))
        ],
      )
    ],
  );

  final stories = Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 9,
        itemBuilder: (context, index) => new Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                // new Container(
                //   width: 60.0,
                //   height: 60.0,
                //   decoration: new BoxDecoration(
                //       shape: BoxShape.circle,
                //       image: new DecorationImage(
                //           fit: BoxFit.fill,
                //           image: new NetworkImage(
                //               "https://pbs.twimg.com/profile_images/980081554696359941/hHKknwEE_400x400.jpg"))),
                //   margin: EdgeInsets.symmetric(horizontal: 8.0),
                // ),

                Material( // This is the widget that shows the stores
                  //elevation: 2.0,
                  shape: CircleBorder(),
                  //color: Colors.transparent,
                  child: Ink.image(
                    image: new NetworkImage(
                        "https://pbs.twimg.com/profile_images/980081554696359941/hHKknwEE_400x400.jpg"),
                    fit: BoxFit.fill,
                    width: 70.0,
                    height: 70.0,
                    child: InkWell(
                      onTap: () {},
                      child: null,
                    ),
                  ),
                ),
                index == 0
                    ? Positioned(
                        right: 10.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          radius: 10.0,
                          child: new Icon(
                            Icons.add,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : new Container()
              ],
            ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[stories],
      ),
    );
  }
}
