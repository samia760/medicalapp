import 'package:flutter/material.dart';
import 'package:login_page/Welcome.dart';
import 'package:login_page/options.dart';

class Staff extends StatelessWidget {
  const Staff({ Key? key }) : super(key: key);
 Widget textfield({required String hintText,required bool obscureText}){

    return Container(
      width: 300,
      height: 50,
      child: TextFormField(
        
        /*validator: (value){
        if(_firstnameController.text.trim().isEmpty){
       globalKey.currentState!.showSnackBar(
      SnackBar(content: Text(
        "Fields are empty"
      ),),);
        }*/
        

        
        obscureText: obscureText,
        decoration: InputDecoration(
           
           hintText: hintText,
           hintStyle: TextStyle(color: Colors.grey),
           enabledBorder: UnderlineInputBorder(
             borderSide: BorderSide(color: Colors.grey),
             //borderRadius: BorderRadius.circular(20)
           ),
           focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            // borderRadius: BorderRadius.circular(20)
           )
         ),
       ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       extendBodyBehindAppBar: true,
     
       body: SafeArea(
         child: SingleChildScrollView(
           child: Container(
               //width: double.infinity,
               margin: EdgeInsets.symmetric(horizontal:1),
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
               padding: const EdgeInsets.only(right: 330,top:0),
               child: IconButton(onPressed: (){
                
                   Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) => Options()),  
                ); 
               }, icon:Icon(Icons.arrow_back),color:Colors.blue),
             ),
           
              Padding(
           padding: const EdgeInsets.only(top: 0,bottom:10),
           child: Image.asset('assets/logo2.png',width: 250,),
              ),
           
           
           Center(
             child: Padding(
               padding: const EdgeInsets.only(bottom: 70),
               child: Container(
                 width: 320,
                 height: 500,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
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
                child: Column(
                     mainAxisAlignment:MainAxisAlignment.spaceBetween,
                     
                    
                     children: [
               SizedBox(height:30),
                       textfield(hintText: "Fullname",
                    
                       
                       obscureText: false,
                     
                       ),
                       textfield(hintText: "Category",
                    
                       
                       obscureText: false,
                     
                       ),
                        textfield(hintText: "CNIC",
                    
                       
                       obscureText: false,
                     
                       ),
                       textfield(hintText: "PhoneNumber",
                       
                       obscureText: false,
                     
                       ),
                       textfield(hintText: "Gender",
                       
                       obscureText: false,
                     
                       ),
                       textfield(hintText: "Password",
                      
                       obscureText: true,
                      
                       ),//SizedBox(height:1),
                       Container(
                         width: 250,
                 height: 50,
                         child: RaisedButton(
                            //splashColor: Colors.red,
                 elevation: 7,
                   color: Colors.blue,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30),
                     //side: BorderSide(color: Colors.red,width: 2),
                     
                     ),
                     child: Text("Register",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight:FontWeight.bold,shadows: [
                    Shadow(
                        blurRadius: 13.0,
                        color: Colors.grey,
                        offset: Offset(5.0, 5.0),
                        ),
                 ]),),
                           onPressed: (){})),
                           SizedBox(height:30),
                     ],
                    
                   ),
                   
                
               ),
             ),
           ),
              ]
           ),
           ),
         ),
       )
    );
  }
}