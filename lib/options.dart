import 'package:flutter/material.dart';
import 'package:login_page/Hospitalsignup.dart';
import 'package:login_page/Patient_signup.dart';
import 'package:login_page/Pharmacies.dart';
import 'package:login_page/Welcome.dart';
import 'package:login_page/doctorsignup.dart';
import 'package:login_page/staff_signup.dart';
import 'package:login_page/studentsignup.dart';

class Options extends StatelessWidget {
  
Widget containers ({required String name,required Function() onTap}){
return GestureDetector(
      onTap: onTap,
  child:   Padding(
  
  
  
  
           padding: const EdgeInsets.only(top: 0),
  
  
  
  
           child: Center(
  
  
             child: Container(
  
               width: 245,
  
  
  
               height: 50,
  
  
  
  
  
  
  
               decoration: BoxDecoration(
  
  
  
  
                 borderRadius: BorderRadius.circular(10),
  
  
  
                color: Colors.blue,
  
  
  
  
  
  
  
                 boxShadow: [
  
  
  
  
  
  
  
                //color: Colors.white, //background color of box
  
  
  
  
  
  
  
                BoxShadow(
  
  
  
  
  
  
  
                  color: Colors.grey,
  
  
  
  
  
  
  
                  blurRadius: 25.0, // soften the shadow
  
  
  
  
  
  
  
                  spreadRadius: 5.0, //extend the shadow
  
  
  
  
  
  
  
                  offset: Offset(
  
  
  
  
  
  
  
                    6.0, // Move to right 10  horizontally
  
  
  
  
  
  
  
                    6.0, // Move to bottom 10 Vertically
  
  
  
  
  
  
  
                  ),
  
  
  
  
  
  
  
                )
  
  
  
  
  
  
  
              ],
  
  
  
  
  
  
  
               ),
  
  
  
  
  
  
  
               
  
  
  
  
  
  
  
               child: Center(
  
  
  
  
  
  
  
                 child:Column(
  
  
  
  
  
  
  
                  children: [
  
  
  
  
  
  
  
                     SizedBox(height: 16,),
  
  
  
  
  
  
  
                     Text(name,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight:FontWeight.bold,shadows: [
  
  
  
  
  
  
  
                           Shadow(
  
  
  
  
  
  
  
                    blurRadius: 13.0,
  
  
  
  
  
  
  
                    color: Colors.grey,
  
  
  
  
  
  
  
                    offset: Offset(5.0, 5.0),
  
  
  
  
  
  
  
                    ),
  
  
  
  
  
  
  
                        ])),
  
  
  
  
  
  
  
                      // SizedBox(height: 27,),
  
  
  
                           
  
                     
  
  
  
                   ],
  
  
  
  
  
  
  
                 ) 
  
  
  
  
  
  
  
           
  
  
  
  
  
  
  
               ),
  
  
  
  
  
  
  
               
  
  
  
  
  
  
  
               
  
  
  
  
  
  
  
               ),
  
  
  
  
  
  
  
              
  
  
  
  
  
  
  
              
  
  
  
  
  
  
  
               )
  
  
  
  
  
  
  
               
  
  
  
  
  
  
  
               ),
);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
       resizeToAvoidBottomInset: false,
       // extendBodyBehindAppBar: true,
     /* appBar:  AppBar(
      elevation: 0.0,
      
      leading: IconButton(icon:Icon(Icons.arrow_back),color: Colors.blue,iconSize: 30, onPressed: () {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Welcome(),
           ),
         );
        },
        ),
        backgroundColor: Colors.transparent,
      
   ),*/
       body: SafeArea(
         child: Container(
             //width: double.infinity,
            // margin: EdgeInsets.symmetric(horizontal:2),
         decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGPiGoqwJvzn5GDVtIYVY1LDjy3EXYBU_N2A&usqp=CAU'),
            //AssetImage("assets/images/bg.jpg"),
             
            fit: BoxFit.cover,
            ),
         ),
             child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             
           children:[
             GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(
                           MaterialPageRoute(
                 builder:(context)=>Welcome(),
                           ),
                       );
              },
              child: Container(width: 40,height: 30,
                 margin: EdgeInsets.only(right: 330,top: 0),
                              color: Colors.transparent,
                child:  IconButton(icon:Icon(Icons.arrow_back),color: Colors.blue, onPressed: () {
                    Navigator.of(context).pushReplacement(
                           MaterialPageRoute(
                 builder:(context)=>Welcome(),
                           ),
                       );
                      },
                      ),
                 
                 ),
            ),
            /* new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(title: IconButton(icon:Icon(Icons.arrow_back),color: Colors.blue, onPressed: () {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Welcome(),
           ),
         );
        },
        ),
        backgroundColor: Colors.transparent,
      
   ),),*/
            Padding(
         padding: const EdgeInsets.only(top: 0),
         child: Image.asset('assets/logo2.png',width: 250,),
            ),
             SizedBox(height:14),
          containers(name: 'Signup as Doctor',
          onTap: (){
            Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => Doctor())  
            ); 
       
          },
          ),
          SizedBox(height:14),
           containers(name: 'Signup as Patient', 
           onTap: (){
            Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => Patient())  
            ); 
       
          },),
          SizedBox(height:14),
            containers(name: 'Signup as Student', onTap: (){
            Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => Student())  
            ); 
       
          },),
          SizedBox(height:14),
             containers(name: 'Signup as Staff', onTap: (){
            Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => Staff())  
            ); 
       
          },),
          SizedBox(height:14),
             containers(name: 'Signup as Hospital',
              onTap: (){
            Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => Hospital())  
            ); 
       
          },),SizedBox(height:14),
             containers(name: 'Signup as Pharmacist',
              onTap: (){
            Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => Pharmacies())  
            ); 
       
          },),
         
         
            ]
             )
         ),
       )
    );
  }
}