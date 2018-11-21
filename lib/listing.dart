import 'package:flutter/material.dart';

class Listing extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Note List')
      ),
      body:Center(
        child: FlatButton(
          child: Text("Back"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      )
    );
  }
}