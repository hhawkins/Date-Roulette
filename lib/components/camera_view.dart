import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraGallery(
      ),
    );
  }
}

class CameraGallery extends StatefulWidget {
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraGallery> {
  File _image;
  var picker = ImagePicker();

  Future getImage() async {
    var image = await ImagePicker.platform.pickImage(source: ImageSource.gallery); //getImage(source: ImageSource.gallery);
    // setState(() {
    //   _image = image as File;
    // });
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future captureImage() async {
    var image = await ImagePicker.platform.pickImage(source: ImageSource.camera); //getImage(source: ImageSource.gallery);
    // setState(() {
    //   _image = image as File;
    // });
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: Center(
        child: Container(
          //alignment: AlignmentDirectional.topEnd,
          child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24), //all(100.0),
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: captureImage,
                  tooltip: 'Select Image',
                  child: Icon(LineAwesomeIcons.camera),
                ),
                SizedBox(width: 60),
                FloatingActionButton(
                  onPressed: getImage,
                  tooltip: 'Pick Image',
                  child: Icon(LineAwesomeIcons.image),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}