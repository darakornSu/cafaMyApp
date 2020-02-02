import 'package:flutter/material.dart';
import 'page0.dart';
import 'page2.dart';
import 'note_list2.dart';

class YourApplication extends StatefulWidget {
  @override
  YourApplicationState createState() {
    return new YourApplicationState();
  }
}

class YourApplicationState extends State<YourApplication> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home, color: Colors.orange,
            ),
            title: Text(
              "Home",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
               color: Colors.orange,
            ),
            title: Text(
              "Popular",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person ,
              color: Colors.orange,
            ),
            title: Text(
              "Add",
            ),
          ),
          
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return MyAppSS(); // Create this function, it should return your first page as a widget
      case 1:
        return Home2(); // Create this function, it should return your second page as a widget
      case 2:
        return NoteList2(); // Create this function, it should return your third page as a widget
      
        
    }

    return Center(child: Text("There is no page builder for this index."),);
  }
}