import 'package:flutter/material.dart';
import 'note_detail.dart';

class NoteList extends StatefulWidget {

	@override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

	int count = 0;
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

	    body: getNoteListView(),
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


	    floatingActionButton: FloatingActionButton(
		    onPressed: () {
		      debugPrint('FAB clicked');
		      navigateToDetail('Add Note');
		    },

		    tooltip: 'Add Note',

		    child: Icon(Icons.add),

	    ),
    );
  }

  ListView getNoteListView() {

		TextStyle titleStyle = Theme.of(context).textTheme.subhead;

		return ListView.builder(
			itemCount: count,
			itemBuilder: (BuildContext context, int position) {
				return Card(
					color: Colors.white,
					elevation: 2.0,
					child: ListTile(

						leading: CircleAvatar(
							backgroundColor: Colors.yellow,
							child: Icon(Icons.keyboard_arrow_right),
						),

						title: Text('Dummy Title', style: titleStyle,),

						subtitle: Text('Dummy Date'),

						trailing: Icon(Icons.delete, color: Colors.grey,),

						onTap: () {
							debugPrint("ListTile Tapped");
							navigateToDetail('Edit Note');
						},

					),
				);
			},


		);
  }

  void navigateToDetail(String title) {
	  Navigator.push(context, MaterialPageRoute(builder: (context) {
		  return NoteDetail(title);
	  }));
  }
  
}
  