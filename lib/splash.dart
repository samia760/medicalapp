import 'dart:async';


import 'package:flutter/material.dart';
import 'package:login_page/Welcome.dart';



class Splash extends StatefulWidget {
   //final urlImage='https://png.pngtree.com/thumb_back/fw800/background/20190221/ourmid/pngtree-delicious-food-white-board-image_26245.jpg';

 // const Splashscreen({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          Welcome()
                                                         )
                                       )
         );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       body: Container(
         
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
       
     Padding(
       padding: const EdgeInsets.only(top: 55),
       child: Image.asset('assets/logo2.png',width: 300,),
     ),
     Padding(
     // padding: const EdgeInsets.only(top: 55),
      padding: const EdgeInsets.only(top: 7,),
      child: Column(
             
         children: [
             Container(
             margin: EdgeInsets.only(top: 10),
               child:Image(image: NetworkImage('https://nephos.eu/wp-content/uploads/2021/03/Health-_Monochromatic.png')),
              
                
             ),
            

     ]

     ),)
      ] ))
    );
  }
}
