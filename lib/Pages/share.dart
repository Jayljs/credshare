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

  Widget build(BuildContext context)  {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
                color:Color(0xff2d386b)
            ),
            backgroundColor: Colors.grey,
            title: Align(
              alignment: Alignment(-0.3,0),
              child: Text ('Share',
                style: TextStyle(fontStyle: FontStyle.italic,
                    color: Color(0xff2d386b),
                    fontSize: 20.0
                ),
              ),
            )
        ),
      body:Stack(
        fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/homes.png"),
              fit: BoxFit.cover,
            ),
            Center(
              child: StreamBuilder(
            stream:Firestore.instance.collection("users").document(user.uid).snapshots(),
            builder: (context,snapshot) {
              if (!snapshot.hasData)
                return Center(child: Text ('Loading data... Please Wait...',style: TextStyle(fontStyle: FontStyle.italic,color: Color(0xff2d386b)),));
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
    String _number,_receive;
    return new ListView(
      children: <Widget>[
        SizedBox(height:20),
        new Form(
          child: new Column(
            children: <Widget>[
              SizedBox(height:110),
              new TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Please key in a number';
                  }
                  else if (input.runtimeType != int){
                    return "Please key in an integer";
                  }
                },
                onSaved: (input) => _number = input,
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

