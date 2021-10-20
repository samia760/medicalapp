import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Login.dart';
import 'package:login_page/Welcome.dart';
import 'package:login_page/options.dart';

class Patient extends StatelessWidget {
  //
  //const Patient({ Key? key }) : super(key: key);
   final _patientnameController =TextEditingController();
  final _diseaseController =TextEditingController();
  final _cnicController =TextEditingController();
  final _emailController =TextEditingController();
  final _phonenumberController =TextEditingController();
  final _passController =TextEditingController();
  
  GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
  Future<bool> registerUser(String patientname,String disease,String cnic,String phonenumber, String email, String pass) async{
FirebaseAuth _auth= FirebaseAuth.instance;
try{
AuthResult result =await _auth.createUserWithEmailAndPassword(email:_emailController.text,password: _passController.text);
  FirebaseUser user=result.user;
  Firestore.instance.collection('userData').document(user.uid).setData(
        { 
          'patientrname':_patientnameController.text,
           'disease':_diseaseController.text,
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
if(_patientnameController.text.trim().isEmpty || _patientnameController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "doctor Name is empty"
    ))
  );
  return;
}
if(_diseaseController.text.trim().isEmpty || _diseaseController.text.trim() == null){
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
        
        /*validator: (value){
        if(_firstnameController.text.trim().isEmpty){
       globalKey.currentState!.showSnackBar(
      SnackBar(content: Text(
        "Fields are empty"
      ),),);
        }*/
        

        controller: controller,
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
                      SizedBox(height:30),
                       textfield(hintText: "Patientname",
                    
                       
                       obscureText: false, controller: _patientnameController,
                     
                       ),
                       textfield(hintText: "Address",
                    
                       
                       obscureText: false, controller: _diseaseController,
                     
                       ),
                       textfield(hintText: "PhoneNumber",
                       
                       obscureText: false, controller: _phonenumberController,
                     
                       ),
                       textfield(hintText: "Email",
                       
                       obscureText: false, controller: _emailController,
                     
                       ),
                       textfield(hintText: "CNIC",
                       
                       obscureText: false, controller: _cnicController,
                     
                       ),
                       textfield(hintText: "Password",
                      
                       obscureText: true, controller: _passController,
                      
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
                           onPressed: ()async{
                              final patientname=_patientnameController.text.toString().trim();
             final disease=_diseaseController.text.toString().trim();
              final cnic=_cnicController.text.toString().trim();
              final email=_emailController.text.toString().trim();
              final phonenumber=_phonenumberController.text.toString().trim();
             final pass=_passController.text.toString().trim();
             bool result = await registerUser( patientname, disease,cnic,phonenumber,email,pass);
             if(result){
               Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=>LoginPage()
                 ));
           
             }
             else{
               validation();
             }

                           }),
                           ),
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