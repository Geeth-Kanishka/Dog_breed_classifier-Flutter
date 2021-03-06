import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  classify(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults:5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classify(_image);
  }

  pickImage_Gallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classify(_image);
  }

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple[800],
        title: Text(
          'Dog Classifier',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        padding:EdgeInsets.fromLTRB(35,0,35,20) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "IMAGE",
              style:TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize:20,
              ) ,
            ),
            SizedBox(height: 20),
            Container(
              child: Center(
                child: _loading == true ? null : Container(
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        child: Container(
                          child: Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      _output != null ? Text(
                        ' ${_output[0]['label']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                          : null,

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: pickImage,
                    child: Container(
                      width: 250,
                      alignment: Alignment.center,
                      padding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.purple[800],
                      ),
                      child: Text(
                        'Camera',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: pickImage_Gallery,
                    child: Container(
                      width: 250,
                      alignment: Alignment.center,
                      padding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.purple[800],
                      ),
                      child: Text(
                        'Gallery',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}