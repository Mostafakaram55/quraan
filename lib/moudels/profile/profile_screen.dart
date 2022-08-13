
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quraan/const/const.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File file;
  Future pickerCamera()async
  {
    final Myfile=await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      file=File(Myfile.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
        backgroundColor: c,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text('UserName'),
          SizedBox(
            height: 10,
          ),
          Text('Phone'),
          MaterialButton(
            height: 100,
            elevation: 7,
            minWidth: 70,
            color: c,
              onPressed:pickerCamera ,
            child: Text('Upload Image',style: TextStyle(
              color: Colors.white
            ),),
          ),
          Center(
            child: file==null?Text('no'):Image.file(file),
          ),
        ],
      ),
    );
  }
}
