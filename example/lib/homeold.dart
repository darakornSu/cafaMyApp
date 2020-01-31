import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title; 
    // https://picsum.photos/id/99/800/600
  var images = <String>['109', '146', '1099', '1010'];
  var titles = <String>[
    'A', 'B', 'C', 'D'];
  // var selected = <bool>[ true, false, false, false ];
  var selectedIndex = 0;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    }); 
  }

  int _selectedIndex = 0;
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red);
static const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 0: Home',
    style: optionStyle,
  ),
  Text(
     'Index 1: Search',
     style: optionStyle,
  ),
  Text(
     'Index 2: Add',
     style: optionStyle,
  ),
  Text(
     'Index 3: Like',
     style: optionStyle,
  ),
  Text(
     'Index 4: Me',
     style: optionStyle,
  ),
];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          title: Image.asset(
          'images/iglogo.jpg',
          width: 350,
          height: 90,  
        ),
        actions: <Widget>[
          
          IconButton(
            icon: Icon(Icons.near_me),
            onPressed: () {},
          ),
        ],
    ),
     body: Center(
        child: ListView(
          padding: EdgeInsets.all(10),
          // children: widget.images.map( (img) {
          // children: List.generate(10, (i) { return i*i; })
          children: List.generate(widget.images.length, (i) {
            return ListTile(
              onTap: () { 
                setState( () {
                  widget.selectedIndex = i; 
                  print('กดที่ index = ${widget.selectedIndex}');
                } );
              },
              contentPadding: EdgeInsets.all(2),
              title: Image.network('https://picsum.photos/id/${widget.images[i]}/800/600'),
              // subtitle: Text("${widget.titles[i]}"),
              subtitle: (widget.selectedIndex == i)? 
                Row(
                  children: <Widget>[
                    CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/id/${widget.images[i]}/800/600'),
),
                    Text("${widget.titles[i]}")
                    ],
                  )
                : Text("${widget.titles[i]}"),
            );
          }),
        ),
      ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.control_point),
          title: Text('Add'),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text('Like'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          title: Text('Me'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
      onTap: _onItemTapped,
    ),
  );
  
}

}

