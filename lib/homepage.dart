//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Login.dart';
import 'package:login_page/Profile.dart';
import 'package:login_page/bottom.dart';
import 'package:login_page/main.dart';
import 'package:login_page/map.dart';
import 'package:login_page/placeslists.dart';
import 'package:login_page/screen2.dart';
import 'package:login_page/screen3.dart';

class HomePage extends StatefulWidget {
 // const HomePage({ Key? key }) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
 
}

class _HomePageState extends State<HomePage> {
  int currentTab=0;
  Widget categories({required String image,required String name,required Function() onTap}){
     return Column(
   children: [
     GestureDetector(
       onTap:onTap,
       child: Container(
         margin: EdgeInsets.only(left: 20,top: 10),
         height: 170,
         width: 140,
         
     decoration: BoxDecoration(
       
       image: DecorationImage(image:NetworkImage(image),
       fit:BoxFit.cover),
       color: Colors.grey,
       
       
       borderRadius: BorderRadius.circular(10),
        
     ),
     
       ),
     ),
     SizedBox(height: 10,),
     Text(
       name,
       style: TextStyle(
         fontSize: 18,
         color: Colors.black
       ) ,
     )

   ],
     );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor:Colors.blue,shadowColor: Colors.grey,foregroundColor: Colors.white,
          title:Padding(
            padding: const EdgeInsets.only(left: 240),
            child: CircleAvatar(
                     maxRadius: 14,
                     
                       backgroundColor: Colors.white,
                     child: CircleAvatar(
                       maxRadius: 15,
                     backgroundImage:NetworkImage('https://themefam.com/wp-content/uploads/2019/09/no-image-baby.png') 
                   
                     ),
                   ),
          )
         
       ),
       bottomNavigationBar:Container(
         decoration: BoxDecoration(
            color: Colors.blue,
           boxShadow: [
              //background color of box
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              )
            ],
         ),
         
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) =>   Search())  
                ); 
                currentTab=0;
           
                         
                        });
                      },
                    
                      
                      
                      child:Text("Doctor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,
                          //color: currentTab == 0 ? 
                        color:  Colors.white
                          // : Colors.black
                           ))),
                          
                  MaterialButton(
                      minWidth: 60,
                      onPressed: () {
                        setState(() {
                       
                   Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) =>   MyApp1())  
                ); 
              
                          currentTab=1;
                        }
                        );
                      },
                      child: Text("Pharma",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,
                         // color: currentTab == 1 ? Colors.white : Colors.black
                         color:  Colors.white
                          ))),
                  MaterialButton(
                      minWidth: 60,
                      onPressed: () {
                        setState(() {
                           Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) =>   Search())  
                ); 
                          currentTab = 2;
                        });
                      },
                      child: Text("Hospital",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,
                         // color: currentTab == 2 ? Colors.white : Colors.black
                         color:  Colors.white
                          ))),
                ]
            )
       ),
      
     
      drawer: Drawer(  
      
        child: ListView(  
          // Important: Remove any padding from the ListView.  
          padding: EdgeInsets.zero,  
          
          children: <Widget>[  
           SizedBox(height:60),
            ListTile(  
              leading: Icon(Icons.account_circle),title: Text("Update Profile"),  
              onTap: () {  
               // Navigator.pop(context);  
               // Screen4();
               Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Screen4()));
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.search),title: Text("Search Doctor"),  
              onTap: () {  
               Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Search()));
              },  
            ), 
             ListTile(  
              leading: Icon(Icons.search),title: Text("Search Patient"),  
              onTap: () {  
               Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Search()));
              
              },  
            ), 
            ListTile(  
              leading: Icon(Icons.search),title: Text("Search Hospital"),  
              onTap: () {  
                Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Search()));
              
              },  
            ), 
            ListTile(  
              leading: Icon(Icons.calendar_today), title: Text("Book Appointment"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ), 
            ListTile(  
              leading: Icon(Icons.logout), title: Text("Logout"),  
              onTap: () {  
              Navigator.pop(context);  
              FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    ),
                  );
               
               
              }
            ),    
          ],  
        ),
        
      ),
      

    
      body:////

      ListView(

      
        children:[ 
          Row(
          children:[
            Padding(
              padding: const EdgeInsets.only(top: 17,left: 17),
              child: Text("Top Specialists",style: TextStyle(fontSize: 20,color:Colors.black54))
            ),
          ]
          ),
          
          SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child:   Row(
   
     children: [
      
       
          categories(
         image:'https://static.medmonks.com/home/img/blog/cardiologist-india.jpg',
          name:"Heart Specialist", onTap: () {  },
         ),
         categories(
         image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc1VcCChxwxxGeKRBBdRYNYdcQfTSg0CGg4Q&usqp=CAU',
          name:"Cardio Spacialist", onTap: () {  },
         ),
         categories(
         image:'http://thesocialnewspaper.com/wp-content/uploads/2019/07/7-Steps-to-Becoming-a-Rich-Dentist-Even-with-200000-to-600000-of-Student-Loan-Debt-no1-min.jpg',
          name:"Dental", onTap: () {  },
         ),
         categories(
         image: "https://www.getldi.com/wp-content/uploads/2019/06/Laser-Surgery-LDI.png",
          name:"Skin Specialist", onTap: () {  },
         ),
          categories(
         image:'https://thumbs.dreamstime.com/b/lungs-issues-medical-concept-photo-female-doctor-empty-space-pulmonologist-doctor-lungs-specialist-aesthetic-handdrawn-229326922.jpg',
          name:"lungs", onTap: () {  },
         ),     ],
     ),
),
        
       /*   Expanded(
           child : Align(
              alignment: FractionalOffset.bottomCenter,
        child: Container(
          color: Colors.blue,
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) =>   HomePage())  
                ); 
                currentTab=0;
           
                         
                        });
                      },
                      child: Text("Doctor",style: TextStyle(fontWeight: FontWeight.bold,
                          color: currentTab == 0 ? Colors.white : Colors.black))),
                  MaterialButton(
                      minWidth: 60,
                      onPressed: () {
                        setState(() {
                           Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) =>   Screen2())  
                ); 
                          currentTab=1;
                        });
                      },
                      child: Text("Pharma",style: TextStyle(fontWeight: FontWeight.bold,
                          color: currentTab == 1 ? Colors.white : Colors.black))),
                  MaterialButton(
                      minWidth: 60,
                      onPressed: () {
                        setState(() {
                           Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) =>   Screen3())  
                ); 
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
         )
            )),*/
        ]
    )
      
    );
  }
}