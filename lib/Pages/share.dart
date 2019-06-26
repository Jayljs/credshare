import 'package:flutter/material.dart';
import 'package:credshare/main.dart';


class SharingPage extends StatefulWidget{
  @override
State createState() => new SharingPageState();
}

class SharingPageState extends State<SharingPage> {
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
      body:new Content(),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
        new Container(
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

