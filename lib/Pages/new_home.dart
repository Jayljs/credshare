import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credshare/Pages/Setup/signIn.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
    @required this.user
  }): super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context){
  return Scaffold(
    body: new Stack(
      fit: StackFit.expand,
      children:<Widget>[
        new Image(
          image: new AssetImage("assets/homes.png"),
          fit: BoxFit.cover,
        ),

       StreamBuilder(
        stream:Firestore.instance.collection("users").document(user.uid).snapshots(),
        builder: (context,snapshot){
          if (!snapshot.hasData) return Text ('Loading data... Please Wait...');
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
                                      color: Color(0xff2d386b),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5.0),
                                  new Text(snapshot.data['breakfast_credits_left'].length.toString(), style: new TextStyle(
                                      color: Color(0xff2d386b),
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
                                      color: Color(0xff2d386b),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500)),
                                  SizedBox(height: 5.0),
                                  new Text(snapshot.data['dinner_credits_left'].length.toString(), style: new TextStyle(
                                      color: Color(0xff2d386b),
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
                              style: new TextStyle(color: Color(0xff2d386b),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500))
                      )
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.transparent
                  ),
                  child: DataTable(
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text('')
                      ),
                      DataColumn(
                        label: Text('')
                      ),
                      DataColumn(
                        label:Text('')
                      )
                    ],
                      rows: <DataRow> [
                        DataRow(
                          cells:<DataCell> [
                            DataCell(
                              Text(snapshot.data['recent_transactions_name'][0].toString(),
                                style: TextStyle(color: Colors.white,fontSize:12.0,),
                              ),
                            ),
                            DataCell(
                              Text(snapshot.data['recent_transactions_credits'][0].toString(),
                                style: TextStyle(color: Colors.white,fontSize:12.0,)
                              ),
                            ),
                            DataCell(
                              Text(snapshot.data['recent_transactions_date'][0].toString(),
                                  style: TextStyle(color: Colors.white,fontSize:12.0,))
                            )
                          ]
                        ),
                        DataRow(
                            cells:<DataCell> [
                              DataCell(
                                Text(snapshot.data['recent_transactions_name'][1].toString(),
                                  style: TextStyle(color: Colors.white,fontSize:12.0,),
                                ),
                              ),
                              DataCell(
                                Text(snapshot.data['recent_transactions_credits'][1].toString(),
                                    style: TextStyle(color: Colors.white,fontSize:12.0,)
                                ),
                              ),
                              DataCell(
                                  Text(snapshot.data['recent_transactions_date'][1].toString(),
                                      style: TextStyle(color: Colors.white,fontSize:12.0,))
                              )
                            ]
                        ),
                        DataRow(
                            cells:<DataCell> [
                              DataCell(
                                Text(snapshot.data['recent_transactions_name'][2].toString(),
                                  style: TextStyle(color: Colors.white,fontSize:12.0,),
                                ),
                              ),
                              DataCell(
                                Text(snapshot.data['recent_transactions_credits'][2].toString(),
                                    style: TextStyle(color: Colors.white,fontSize:12.0,)
                                ),
                              ),
                              DataCell(
                                  Text(snapshot.data['recent_transactions_date'][2].toString(),
                                      style: TextStyle(color: Colors.white,fontSize:12.0,))
                              )
                            ]
                        )

                      ],
                  ),
                  
                ),
              )
            ],
          );
        },
      ),
    ],
    ),
  );}
}