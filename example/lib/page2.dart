import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'details.dart';
import 'data.dart';
import 'badge.dart';


class Home2 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home2> {
  final TextEditingController _searchControl = new TextEditingController();
  var images = <String>['images/1.jpg', 'images/1.jpg', 'images/1.jpg', '1010'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          Center(
            child: Icon(Icons.beach_access, color:  Colors.grey,
             // icon: Feather.getIconData("shopping-cart"),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.only(left: 20),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Popular Products",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),

              FlatButton(
                child: Text(
                  "View More",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onPressed: (){},
              ),
            ],
          ),

          Container(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: furnitures.length,
              itemBuilder: (BuildContext context, int index) {
                Map furniture = furnitures[index];

                return Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context){
                            return Details();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "${furniture["img"]}",
                          height: 140,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                        
                      ),
                    ),
                  ),
                );
              },
            ),
          ),


          

          SizedBox(height: 10),
        ],
      ),
    );
  }
}
