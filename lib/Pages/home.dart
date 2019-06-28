import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credshare/Pages/Setup/signIn.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
    @required this.user
  }): super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: MainContent(),
    );
  }
}


class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
        new Container(
            child: new Column(
              children: <Widget>[
                new Text("CredShare",
                    style: TextStyle(fontStyle: FontStyle.italic,
                        fontSize: 20.0)
                ),
                new Container(
                  height: 80.0,
                  decoration: new BoxDecoration(
                      color: Colors.transparent
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new MaterialButton(
                              child: new Icon(
                                Icons.compare_arrows,
                                color: Color(0xff2d386b),
                                size: 40.0,
                              ),
                              onPressed: () {Navigator.of(context).pushNamed('/SharingPage');}
                          ),
                          new Text("Share", style: new TextStyle(
                              color: Color(0xff2d386b),
                              fontWeight: FontWeight.w500))
                        ],
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new MaterialButton(
                              child: new Icon(
                                Icons.camera_enhance,
                                color: Color(0xff2d386b),
                                size: 40.0,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/qrPage');
                              }
                          ),
                          new Text("QR Scanner", style: new TextStyle(
                              color: Color(0xff2d386b),
                              fontWeight: FontWeight.w500))
                        ],
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MaterialButton(
                              child: new Icon(
                                Icons.perm_identity,
                                color: Color(0xff2d386b),
                                size: 40.0,
                              ),
                              onPressed: () {}
                          ),
                          new Text("Expiry", style: new TextStyle(
                              color: Color(0xff2d386b),
                              fontWeight: FontWeight.w500)
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(color: Colors.black38
                ),
                SizedBox(height: 10.0),
                new Row(
                  children: <Widget>[
                    new Container(
                      height: 60.0,
                      decoration: new BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: new Column(
                          children: <Widget>[
                            new Text("Breakfast Balance:", style: new TextStyle(
                                color: Color(0xff5b6990),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),),
                            SizedBox(height: 5.0),
                            new Text("100", style: new TextStyle(
                                color: Color(0xff5b6990),
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700),
                              textAlign: TextAlign.start,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 140.0),
                    new Container(
                      height: 60.0,
                      decoration: new BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: new Column(
                          children: <Widget>[
                            new Text("Dinner Balance:", style: new TextStyle(
                                color: Color(0xff5b6990),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500)),
                            SizedBox(height: 5.0),
                            new Text("100", style: new TextStyle(
                                color: Color(0xff5b6990),
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Align(
                    alignment: Alignment.topLeft,
                    child: new Text ("Recent Transactions",
                        style: new TextStyle(color: Color(0xff5b6990),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500))
                )
              ],
            )
        ),
      ],
    );
  }
}