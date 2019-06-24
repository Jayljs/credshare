import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:credshare/Pages/home.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}



class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation ;

  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override

  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration (milliseconds:1000)
    );
    _iconAnimation= new CurvedAnimation(
        parent:_iconAnimationController,
        curve: Curves.easeOut
    );
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in to CredShare'),
        backgroundColor: Colors.indigo,
      ),
      body: Form(
        key: _formKey,

        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Please type an email';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
            TextFormField(
              validator: (input) {
                if(input.length < 6){
                  return 'Your password needs to be at least 6 characters';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
            ),
            RaisedButton(
              color:Colors.indigo,
              textColor:Colors.white,
              onPressed: signIn,
              child: Text('Sign In'),
            ),
            Image(
              image: AssetImage("assets/login.jpg"),
              fit: BoxFit.cover,
            ),
          ],
        ),

      ),
    );
  }


  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()) {
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user), fullscreenDialog: true));

        //TODO: Navigate to home

      }catch(e){
        print(e.message);
      }
    }
  }
}
