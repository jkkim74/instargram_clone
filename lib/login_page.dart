import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:instagram_clone/tab_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn  = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Instagram Clone',
              style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),),
            const Padding(padding: EdgeInsets.all(50.0)),
            SignInButton(Buttons.Google, onPressed: (){
              _handleSignIn().then((user) =>
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabPage(user.user!))));
            })
          ],
        ),
      ),
    );
  }

  Future<UserCredential> _handleSignIn() async{
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
