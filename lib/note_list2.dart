import 'package:flutter/material.dart';
import 'note_detail.dart';

class NoteList2 extends StatefulWidget {

	@override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<NoteList2> {

	int count = 0;

	@override
  Widget build(BuildContext context) {

    return Scaffold(

	    appBar: AppBar(
         backgroundColor: Colors.orangeAccent,
		    title: Text('Add Review'),
	    ),

	    body: getNoteListView(),

      

	    floatingActionButton: FloatingActionButton(
		    onPressed: () {
		      debugPrint('FAB clicked');
		      navigateToDetail('Add Note');
		    },

		    tooltip: 'Add Review',

		    child: Icon(Icons.add, color: Colors.orange,),

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
