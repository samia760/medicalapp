import 'package:flutter/material.dart';
import 'package:login_page/homepage.dart';
import 'package:login_page/screen2.dart';
import 'package:login_page/screen3.dart';

class Bottom extends StatefulWidget {
  const Bottom({ Key? key }) : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int currentTab = 0;

  Widget currentScreen =HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: PageStorageBucket(), child: currentScreen),
            
      bottomNavigationBar: BottomAppBar(
        // notchMargin: 50,
        color: Colors.blue,
        child: Container(
          height: 60,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen =HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Text("Doctor",style: TextStyle(fontWeight: FontWeight.bold,
                        color: currentTab == 0 ? Colors.white : Colors.black))),
                MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen =Screen2();
                        currentTab = 1;
                      });
                    },
                    child: Text("Pharma",style: TextStyle(fontWeight: FontWeight.bold,
                        color: currentTab == 1 ? Colors.white : Colors.black))),
                MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = Screen3();
                        currentTab = 2;
                      });
                    },
                    child: Text("Hospital",style: TextStyle(fontWeight: FontWeight.bold,
                        color: currentTab == 2 ? Colors.white : Colors.black))),
              /*  MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen =//Screen4();
                        currentTab = 3;
                      });
                    },
                    child: Icon(Icons.person,
                        color: currentTab == 3 ? Colors.white : Colors.black)),*/
                        
              ]),
        ),
      ),
      );
  }
}