import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'appTheme.dart';
import 'counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MyTheme myTheme = MyTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exodus',
      theme: myTheme.buildRallyTheme(),
      home: MyHomePage(title: 'Exodus'),
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  PageController pageController = PageController();

  var _children = <Widget>[
    Counter(),
    Text("asdf"),
    Counter(),
    Counter(),
    Counter(),
  ];

  var bottomNavigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: const Icon(Icons.add_comment),
      title: Text(
        "Comment",
      ),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.calendar_today),
      title: Text(
        "Calendar",
      ),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.account_circle),
      title: Text(
        "Account",
      ),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.alarm_on),
      title: Text(
        "Alarm",
      ),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.camera_enhance),
      title: Text(
        "Camera",
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: PageView(
          controller: pageController,
          children: _children,
          onPageChanged: _onPageChanged,
          physics: RangeMaintainingScrollPhysics(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

