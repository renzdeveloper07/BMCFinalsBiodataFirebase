import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // ApppEntry point

class MyApp extends StatelessWidget {
    // widget no changes oure display
@override
    Widget build(BuildContext context) {
      // describe what to show
    return MaterialApp(
    home: FirstScreen()
    );
    }
}
class FirstScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // describe what to show
    return Scaffold(
   appBar: AppBar(title: Text('My First Web')),
   body:Center(
          child: Column ( // vertical laay out 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, size: 60),
          SizedBox(height: 30),
          Row( 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.thumb_down, size: 500,),
            Icon(Icons.thumb_up, size: 500,),
          ],
          ),
          SizedBox(height: 10,),
          Text('Hello Classmate'),
          SizedBox(height: 20,),
          ElevatedButton( 
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context)
                => SecondScreen()),
              );
            },
            child: Text('go to second screen'),
          ),
        ],
          ), 
        ),
      );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Second Screen')),
        body: Center(
          child: ElevatedButton (
            onPressed: () => Navigator.pop(context), child: Text('Go back')),
        ),
      );
    }
  }










