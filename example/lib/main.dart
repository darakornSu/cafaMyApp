import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'bot.dart';

//import 'package:flutter/services.dart';

//import 'home.dart';
import 'note_list.dart';
import 'note_detail.dart';
import 'page1.dart';
import 'test.dart';
//import 'test2.dart';
import 'page0.dart';


void main() {
 
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(MyAppOil ());
}
class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 50), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: RotatedBox(
          quarterTurns:(animation.value/20).floor(),
          child: Image.network('https://picsum.photos/200/200'),
        )
        
      ),
    );
  }
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        // See https://github.com/flutter/flutter/wiki/Desktop-shells#fonts
        fontFamily: 'Roboto',
      ),
      //home: MyHomePage(title: 'oil Demo Home Page'),
    );
  }
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



