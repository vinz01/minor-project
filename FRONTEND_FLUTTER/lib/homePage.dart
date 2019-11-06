import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterimageapp/showData.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


class HomePage extends StatefulWidget{
  createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  File _imageFile;
  String _filePath1='images/test.png';

Future<void> _pickImage(ImageSource source) async{
  File selected = await ImagePicker.pickImage(source: ImageSource.camera);
  setState(() {
    _imageFile = selected;
  });
}

Future<void> _cropImage() async{
  File cropped = await ImageCropper.cropImage(
    sourcePath: _imageFile.path,
    toolbarColor: Colors.purple,
    toolbarWidgetColor: Colors.white,
    toolbarTitle: "CROP"
  );
  setState(() {
    _imageFile = cropped ?? _imageFile ;
  });

}

void _clear(){
  setState(() {
    _imageFile = null;
  });
}




  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "ASSETS SPIT",textAlign: TextAlign.center,
        ),
        actions: <Widget>[
            IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: () {
               Navigator
              .of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) => ShowData(filePath : _filePath1)));
              print(_filePath1);
            },
          ),
        ],
    ),
    bottomNavigationBar: BottomAppBar(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () {
              _pickImage(ImageSource.camera);
            },
          ),
          IconButton(
            icon: Icon(Icons.photo_library),
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
          )
        ],
      ),
    ),
    body: ListView(
      children: <Widget>[
        if (_imageFile != null) ...[
          Image.file(_imageFile),
          Row(
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.crop),
                onPressed: _cropImage,
              ),
              FlatButton(
                child: Icon(Icons.refresh),
                onPressed: _clear,
              )
            ],
          ),
          Uploader(file : _imageFile),



        ]
      ],
    ),
  );
  }
}
class Uploader extends StatefulWidget{
  final File file;
  Uploader({Key key,this.file}) : super(key : key);
  createState() => _UploaderState();
}
class _UploaderState extends State<Uploader>{
  final FirebaseStorage _storage = 
    FirebaseStorage(storageBucket: 'gs://assets-bills.appspot.com');
    StorageUploadTask _uploadTask;

    void _startUpload(){
      String filePath = 'images/${DateTime.now()}.png';
      setState(() {
        _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
      });
    }

    @override
    Widget build(BuildContext context){
      if (_uploadTask != null){
          return StreamBuilder<StorageTaskEvent>(
            stream: _uploadTask.events,
            builder: (context,snapshot){
              var event = snapshot ?.data?.snapshot;
              double progressPercent = event != null ?event.bytesTransferred/event.totalByteCount:0;
              return Column(
                children: <Widget>[
                  if (_uploadTask.isComplete)
                    Text('COMPLETED'),
                  if (_uploadTask.isPaused)
                    FlatButton(
                      child: Icon(Icons.play_arrow),
                      onPressed: _uploadTask.resume,
                    ),
                  if (_uploadTask.isInProgress)
                    FlatButton(
                      child: Icon(Icons.pause),
                      onPressed: _uploadTask.pause,
                    ),
                    LinearProgressIndicator(value: progressPercent),
                    Text(
                      '${(progressPercent * 100).toStringAsFixed(2)}%'
                    )
                ],
              );
            },
          );
      }
      else {
        return FlatButton.icon(
          label: Text('Upload to Firebase'),
          icon: Icon(Icons.cloud_upload),
          onPressed: _startUpload,
        );
      }
    }
}