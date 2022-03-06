
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final User user;
  CreatePage(this.user);


  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();


  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  final picker = ImagePicker();
  File? _image;

  Future _getImage() async {
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
        _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: _getImage,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.send), onPressed: () {
              final firebaseStorageRef = FirebaseStorage.instance
                  .ref()
                  .child('post')
                  .child('${DateTime.now().millisecondsSinceEpoch}.png');
              final task = firebaseStorageRef.putFile(
                _image!, SettableMetadata(contentType: 'image/png'));

              task.then((TaskSnapshot snapshot){
                var downloadUrl = snapshot.ref.getDownloadURL();
                downloadUrl.then((uri){
                  var doc = FirebaseFirestore.instance.collection("post");
                  doc.add({
                    'id':doc.id,
                    'photoUrl':uri.toString(),
                    'contents':textEditingController.text,
                    'email':widget.user.email,
                    'displayName':widget.user.displayName,
                    'userPhotoUrl':widget.user.photoURL
                  }).then((onValue){
                    Navigator.pop(context);
                  });
                });
              });

        },
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child:Column(
      children: <Widget>[
          _image == null ? Text('No Image') : Image.file(_image!),
          TextField(
            decoration: const InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController,
          )
      ],
    ),
    );
  }


}
