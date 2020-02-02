import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'bot.dart';
import 'package:flutter/animation.dart';  



void main() {
 
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(MyAppOil ());
}

class MyAppOil extends StatelessWidget {

	@override
  Widget build(BuildContext context) {

    return MaterialApp(
	    title: 'NoteKeeper',
	    debugShowCheckedModeBanner: false,
	    theme: ThemeData(
		    primarySwatch: Colors.deepPurple
	    ),
	    home: YourApplication(),

    );
  }
}



