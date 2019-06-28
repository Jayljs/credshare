import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credshare/Pages/new_home.dart';


class SharingPage extends StatelessWidget{
  const SharingPage({
    Key key,
    @required this.user
  }): super(key: key);
  final FirebaseUser user;
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Colors.blueGrey
        ),
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment(-0.3,0),
          child: Text ('Share',
            style: TextStyle(fontStyle: FontStyle.italic,
            color: Colors.blueGrey,
            fontSize: 20.0
            ),
          ),
        )
      ),
      body:Stack(
        fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/share page.jpg"),
              fit: BoxFit.cover,
            ),
            Center(
            child: StreamBuilder(
            stream:Firestore.instance.collection("users").document(user.uid).snapshots(),
            builder: (context,snapshot) {
              if (!snapshot.hasData)
                return Text('Loading data... Please Wait...');
              return new Content();
            },
            ),
            )
          ] ,
      )
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
        new Form(
          child: new Column(
            children: <Widget>[
              SizedBox(height:10.0),
              new TextFormField(
                decoration: new InputDecoration(
                  hintText: "Number of credits (max:3)"
                ),
                style: TextStyle(fontSize: 15.0,
                fontStyle: FontStyle.italic,
                color: Color(0xff2d386b)),
              ),
              SizedBox(height:10.0),
              new TextFormField(
                decoration: new InputDecoration(
                    hintText: "Receiver"
                ),
                style: TextStyle(fontSize: 15.0,
                    fontStyle: FontStyle.italic,
                    color: Color(0xff2d386b)),
              ),
              RaisedButton(
                color:Colors.indigo,
                textColor:Colors.white,
                child: Text('OK'),
                onPressed: (){},
              ),
            ],
          ),
        )
      ],
    );
  }
}

