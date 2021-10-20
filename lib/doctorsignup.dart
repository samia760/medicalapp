import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Login.dart';
import 'package:login_page/Welcome.dart';
import 'package:login_page/options.dart';

class Doctor extends StatelessWidget {
  //const Doctor({ Key? key }) : super(key: key);
   final _fullnameController =TextEditingController();
  final _specialityController =TextEditingController();
  final _cnicController =TextEditingController();
  final _emailController =TextEditingController();
  final _phonenumberController =TextEditingController();
  final _passController =TextEditingController();
  GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
  Future<bool> registerUser(String doctorname,String cnic,String phonenumber, String email,String speciality, String pass) async{
FirebaseAuth _auth= FirebaseAuth.instance;
try{
AuthResult result =await _auth.createUserWithEmailAndPassword(email:_emailController.text,password: _passController.text);
  FirebaseUser user=result.user;
  Firestore.instance.collection('userData').document(user.uid).setData(
        { 
          'doctorname':_fullnameController.text,
           'Speciality':_specialityController.text,
           'nic':_cnicController.text,
           'phonenumber':_phonenumberController.text,
           'email':_emailController.text,
           'pass':_passController.text,
           'userUid':user.uid,
 
        }
    
  );
  return true;
}
  catch(e){
  
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      e.toString()
    ),),);
  return false;
}
  }
//validation

void validation(){
if(_fullnameController.text.trim().isEmpty || _fullnameController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "doctor Name is empty"
    ))
  );
  return;
}
if(_specialityController.text.trim().isEmpty || _specialityController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "Speciality is empty"
    ))
  );
  return;
}
if(_phonenumberController.text.trim().isEmpty || _phonenumberController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "phonenumber is empty"
    ))
  );
  return;
}
if(_cnicController.text.trim().isEmpty || _cnicController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "cnic is empty"
    ))
  );
  return;
}

if(_passController.text.trim().isEmpty || _passController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "password is empty"
    ))
  );
  return;
}

}
 Widget textfield({required String hintText,required bool obscureText,required TextEditingController controller}){

    return Container(
      width: 300,
      height: 50,
      child: TextFormField(
         controller: controller,
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
      key:globalKey,
      resizeToAvoidBottomInset: false,
       extendBodyBehindAppBar: true,
     body: SafeArea(
       child: SingleChildScrollView(
         child: Container(
          //width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal:0),
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
           padding: const EdgeInsets.only(right: 330,top: 0),
           child: IconButton(onPressed: (){

               Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => Options()),  
            ); 
           }, icon:Icon(Icons.arrow_back),color:Colors.blue),
         ),
         Padding(
           padding: const EdgeInsets.only(top: 0,bottom: 10),
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
                      SizedBox(height: 30,),
                       textfield(hintText: "DoctorName",
                    
                       
                       obscureText: false, controller: _fullnameController,
                     
                       ),
                       textfield(hintText: "Speciality",
                    
                       
                       obscureText: false, controller: _specialityController,
                     
                       ),
                       textfield(hintText: "CNIC",
                    
                       
                       obscureText: false, controller: _cnicController,
                     
                       ),
                       textfield(hintText: "PhoneNumber",
                       
                       obscureText: false, controller: _phonenumberController,
                     
                       ),
                       textfield(hintText: "email",
                       
                       obscureText: false, controller: _emailController,
                     
                       ),
                       textfield(hintText: "Password",
                      
                       obscureText: true, controller: _passController,
                      
                       ), //SizedBox(height:1),
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
                           onPressed: ()
                           async{
                 final doctorname=_fullnameController.text.toString().trim();
             final speciality=_specialityController.text.toString().trim();
              final cnic=_cnicController.text.toString().trim();
              final email=_emailController.text.toString().trim();
              final phonenumber=_phonenumberController.text.toString().trim();
             final pass=_passController.text.toString().trim();
             bool result = await registerUser( doctorname, speciality,cnic,phonenumber,email,pass);
             if(result){
               Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=>LoginPage()
                 ));
           
             }
             else{
               validation();
             }

                           }),
                           ),SizedBox(height: 30,)

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