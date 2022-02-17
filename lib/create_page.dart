
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  final imagePicker = ImagePicker();

  late File _image;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: _getImage(),
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.send), onPressed: () {  },
        )
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
          const Text('No Image'),
          TextField(
            decoration: const InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController,
          )
      ],
    );
  }

  void _getImage() {
    var image = imagePicker.pickImage(source: ImageSource.gallery);
  }
}
