import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Photo extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showChoiceDialog(),
    );
  }
}

Future showChoiceDialog() async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Choose source"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              GestureDetector(
                child: Text("Take new picture"),
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
              )
            ],
          ),
        ),
      );
    },
  );
}

void takePhoto(ImageSource source) async {
  final pickedFIle = await _picker.getImage(source: source);
  setState(() {
    _imageFile = pickedFIle;
  });
}
