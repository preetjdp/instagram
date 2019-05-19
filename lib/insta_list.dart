import 'package:backdrop/insta_stories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var deviceSize = MediaQuery.of(context).size; // Not being used
    return new ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => index == 0 ? new SizedBox(
        child: new InstaStories(),
        height: 100.0 ,
      ) : Column(
         mainAxisAlignment: MainAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           // First Row
            Padding(
               padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                      Row(
                         children: <Widget>[
                           new Container(
                              height: 40.0,
                               width: 40.0,
                                decoration: new BoxDecoration(
                                   shape: BoxShape.circle,
                                    image: new DecorationImage(
                                       fit: BoxFit.fill,
                                        image: new NetworkImage("https://pbs.twimg.com/profile_images/877903823133704194/Mqp1PXU8_400x400.jpg")
                                    )
                                ),
                           ),
                           new SizedBox(
                             width: 10.0
                           ),
                           new Text("The Verge", style: TextStyle( fontWeight: FontWeight.bold),)
                         ],
                      ),
                      new IconButton(
                         icon: Icon(Icons.more_vert), onPressed: () {},
                      )
                   ],
               ),
            ),
            //First Row End
            //Second Row
            Flexible(
               fit: FlexFit.loose,
                child: new Image.network(
                  "https://instagram.fbom3-2.fna.fbcdn.net/vp/88141da271a9816ff0d1165a6fbd2f64/5C1DA716/t51.2885-15/e35/40965749_1891885644198466_3007472898483394857_n.jpg",
                   fit: BoxFit.cover,
                ),
            ),
            //Second Row End
            //Third Row
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                 mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                       mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Icon(
                             FontAwesomeIcons.heart
                          ),
                          new SizedBox(
                            width: 16.0
                          ),
                          new Icon(
                             FontAwesomeIcons.comment
                          ),
                          new SizedBox(
                            width: 16.0
                          ),
                          new Icon (
                            FontAwesomeIcons.paperPlane
                          )
                        ],
                    ),
                    new Icon (
                      FontAwesomeIcons.bookmark
                    )
                  ],
              ),
            ),
            //Third Row END
            //Fourth Row Start
             Padding(
                padding: EdgeInsets.symmetric( horizontal: 16.0),
                 child: Text(
                   "Liked By Preet Parekh, Ram Kumar, and 15,000 others",
                    style: TextStyle( fontWeight:  FontWeight.bold)
                 ),
             ),
             // Fourth Row End
             //Fifth Row Start
             Padding(
               padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
               child: Row(
                  mainAxisAlignment:  MainAxisAlignment.start,
                   children: <Widget>[
                     new Container(
                        height: 40.0,
                         width: 40.0,
                          decoration: new  BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage("https://pbs.twimg.com/profile_images/980081554696359941/hHKknwEE_400x400.jpg")
                            )
                          )
                     ),
                     new SizedBox(
                       width: 16.0
                     ),
                      Expanded(
                         child: new TextField(
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                               hintText: "Add a Comment ..."
                            )
                         ),
                      )
                   ],
               ),
             ),
             //fifth row end
             // Sixth Row Start
             Padding(
               padding: const EdgeInsets.symmetric( horizontal: 16.0),
               child: Text(
                 "1 Day Ago",
                 style: TextStyle(color: Colors.grey),
               )
             )
         ],
      ),
    );
  }
}
