import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
    Widget ctaSection = Container(
        padding: EdgeInsets.all(32.0),
        child: FlatButton(
          color: Color(0xFF42A5F5),
          onPressed: () => debugPrint('button pressed yaay!!'),
          child: Text("Press"),
        ));
    return new MaterialApp(
        title: 'Note Fences',
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
        home: Scaffold(
          appBar: AppBar(
            title: Text('Note Fences!!'),
          ),
          body: ListView(
            children: [titleSection, TextForm()],
          ),
        ));
  }
}

class TextForm extends StatefulWidget {
  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final textController = TextEditingController(text: "Hello there!");
  Widget textWidget;

  @override
  void initState() {
    super.initState();
    textWidget = Container(
        padding: EdgeInsets.all(32.0),
        child: TextField(
          controller: textController,
          decoration: InputDecoration(helperText: "Type on..."),
        ));
  }

  Widget btnWidget = Container(
      padding: EdgeInsets.all(32.0),
      child: FlatButton(
        color: Color(0xFF42A5F5),
        onPressed: () => debugPrint('button pressed yaay!!'),
        child: Text("Press"),
      ));


  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Expanded(
        child:Column(
          children: [textWidget, btnWidget],
        )
      ),
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

class RandomWordsState extends State<RandomWords> {
  final List _suggestions = <WordPair>[];
  final Set _saved = new Set<WordPair>();
  final _biggerfont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildSuggestions()
        // appBar: AppBar(title: Text("Random word gen"))
        );
  }

  Widget _buildRow(WordPair pair) {
    final bool _isSaved = _saved.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerfont),
      trailing: Icon(
        _isSaved ? Icons.favorite : Icons.favorite_border,
        color: _isSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (_isSaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
