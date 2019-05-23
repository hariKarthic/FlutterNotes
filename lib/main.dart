import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'listing.dart';

void main() {
  runApp(MyApp()); //React.render()
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //render()
    Widget titleSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Text("Enter your Note"),
    );
    Widget textFieldSection = Container(
      padding: EdgeInsets.all(32.0),
      child: TextField(
        decoration: InputDecoration(hintText: "Feel free..."),
      ),
    );

    return new MaterialApp(
        title: 'Note Fences',
        initialRoute: '/',
        routes: {
          "/":(context) => FirstScreen(),
          "/second": (context) => SecondScreen(),
        },
        theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
        ),
        //home: new MyHomePage(title: 'Note Fences-Home Page'),
        );
  }
}

class SecondScreen extends StatelessWidget{
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
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    Widget titleSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Text("Enter your Note"),
    );
    return Scaffold(
      appBar:AppBar(
        title:  Text('Note Fences'),
      ) ,
      body: ListView(
        children: <Widget>[titleSection,TextForm()],
      ),
    );
  }
}

class TextForm extends StatefulWidget {
  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final textController = TextEditingController();
  Widget textWidget;
  Widget btnWidget;

  @override
  void initState() {
    super.initState();
    textWidget = Container(
        padding: EdgeInsets.all(32.0),
        child: TextField(
          controller: textController,
          decoration: InputDecoration(helperText: "Type on..."),
        ));
    btnWidget = Container(
        padding: EdgeInsets.all(32.0),
        child: FlatButton(
          color: Color(0xFF42A5F5),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Listing()));
          },
          child: Text("Press"),
        ));
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [textWidget, btnWidget],
          ),
        )
      ],
    );
  }
}

class EnterNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget enterNotes = Container(
        padding: EdgeInsets.all(32.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('Enter your note!'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
