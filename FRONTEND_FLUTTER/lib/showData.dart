import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Post {
  final String url;
  
  Post({this.url});
 
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      url: json['eng'],
    );
  }

  Map<String, dynamic> toJson() => {
    "url": url,
  };

 
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["url"] = url;
    
    return map;
  }
}
String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
 
Future<http.Response> createPost(Post post) async{
  var url="http://127.0.0.1:5101/"; 
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: postToJson(post)
  );

  return response;
}
class ShowData extends StatefulWidget {

  final String filePath;
  ShowData({Key key,this.filePath}) : super(key : key);
  @override
  _ShowDataState createState() => new _ShowDataState();

}


class _ShowDataState extends State<ShowData> {
  var output='';
  String s1='';
  String xyz='';
  callAPI(String _text){
    Post post = Post(
      url: _text,//'Testing body body body',
      //title: 'Flutter jam6'
    );
    createPost(post).then((response){
        if(response.statusCode >= 200)
        {
          output = response.body.toString();
        
          print(output);
        }
        else
          print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
    return output;
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'REFRESH DATA'
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
                child : RaisedButton(
                  child: new Text("ADD IMAGE DATA TO DATABASE",style: TextStyle(fontSize: 20)),  
                  textColor: Colors.white,
                  color: Colors.blue,    
                  onPressed: () async {
                    xyz=callAPI(widget.filePath);
                    print("xyz1" + xyz);
                  },    
                ),
            ),
          ],
        ),
      ),
    );
  }
}