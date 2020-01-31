import 'package:flutter/material.dart';


/// This Widget is the main application widget.
class MyAppS extends StatelessWidget {
  static const String _title = 'Flutter App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  PageController _myPage;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 1);
    selectedPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _myPage,
          children: <Widget>[
            Center(
              child: Text("Another Page"),
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Page 1"),
                RaisedButton(
                  onPressed: () {
                    _myPage.jumpToPage(0);
                    setState(() {
                      selectedPage = 0;
                    });
                  },
                  child: Text("Go to another page"),
                )
              ],
            )),
            Center(child: Text("Page 2")),
            Center(child: Text("Page 3")),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                color: selectedPage == 1 ? Colors.blue : Colors.grey,
                onPressed: () {
                  _myPage.jumpToPage(1);
                  setState(() {
                    selectedPage = 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.star),
                color: selectedPage == 2 ? Colors.blue : Colors.grey,
                onPressed: () {
                  _myPage.jumpToPage(2);
                  setState(() {
                    selectedPage = 2;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                ),
                color: selectedPage == 3 ? Colors.blue : Colors.grey,
                onPressed: () {
                  _myPage.jumpToPage(3);
                  setState(() {
                    selectedPage = 3;
                  });
                },
              ),
            ],
          ),
        ));
  }
}