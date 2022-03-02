import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Instargram Clone"
          ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                    children: <Widget>[
                      const Text("Instagram에 오신것을 환영합니다.",style: TextStyle(fontSize: 24.0),),
                      const Padding(padding: EdgeInsets.all(8.0),),
                      const Text("사진과 동영상을 보려면 팔로우 하세요.",style: TextStyle(fontSize: 12.0),),
                      const Padding(padding: EdgeInsets.all(16.0),),
                      SizedBox(
                        width: 260.0,
                        child: Card(
                          elevation: 4.0,
                          child: Column(
                            children: <Widget>[
                              const Padding(padding: EdgeInsets.all(1.0),),
                              SizedBox(
                                width: 80.0,
                                height: 80.0,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(user.photoURL!),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(8.0),),
                              Text(user.email!, style: const TextStyle(fontWeight: FontWeight.bold),),
                              Text(user.displayName!),
                              const Padding(padding: EdgeInsets.all(8.0),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://cdn.pixabay.com/photo/2017/09/21/19/12/france-2773030_1280.jpg',fit: BoxFit.cover,),
                                  ),
                                  const Padding(padding: EdgeInsets.all(1.0),),
                                  SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://cdn.pixabay.com/photo/2017/09/21/19/12/france-2773030_1280.jpg',fit: BoxFit.cover,),
                                  ),
                                  const Padding(padding: EdgeInsets.all(1.0),),
                                  SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://cdn.pixabay.com/photo/2017/09/21/19/12/france-2773030_1280.jpg',fit: BoxFit.cover,),
                                  )
                                ],
                              ),
                              const Padding(padding: EdgeInsets.all(4.0),),
                              const Text('FaceBook 친구'),
                              const Padding(padding: EdgeInsets.all(4.0),),
                              RaisedButton(
                                  child: const Text('팔로우'),
                                  color: Colors.blueAccent,
                                  textColor: Colors.white,
                                  onPressed: () {}
                              ),
                              const Padding(padding: EdgeInsets.all(4.0),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
            ),
          )
      ),
    );

  }


}
