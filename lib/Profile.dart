import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';


import 'package:image_picker/image_picker.dart';
import 'package:login_page/homepage.dart';




class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  
   final _firstnameController =TextEditingController();

  final _lastnameController =TextEditingController();

  final _emailController =TextEditingController();

  final _passController =TextEditingController();

    GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();

   File? image;

   Future<void> getImage()async{
       final   XFile? pickedFile=await ImagePicker().pickImage(source: ImageSource.gallery);
              image=File(pickedFile!.path);
   }
  /*File? _image;
Future<void>getImage()async{
final image= await ImagePicker().pickImage(source: ImageSource.gallery);
 setState(() {
  _image=File(image!.path);
});
}*/

Widget textfield({required String hintText,required bool obscureText,required TextEditingController controller}){

    return TextFormField(
      controller: controller,
      
      obscureText: obscureText,
       decoration: InputDecoration(
         
         hintText: hintText,
         hintStyle: TextStyle(color: Colors.grey),
         enabledBorder: UnderlineInputBorder(
           borderSide: BorderSide(color: Colors.grey)
         )
       ),
     );    
}

  @override
  Widget build(BuildContext context) {
    return 
  Scaffold(
   resizeToAvoidBottomInset:false,
   appBar: AppBar(
      elevation: 0.0,
      leading: IconButton(icon:Icon(Icons.arrow_back),color: Colors.white, onPressed: () {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>HomePage(),
           ),
         );
        },
        ),
   centerTitle: true,
        backgroundColor: Colors.blue,
        //Theme.of(context).redcolor,
        title: Text("Profile",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
         
          Padding(
            padding: const EdgeInsets.only(top: 15,right: 10),
            child: Text("Edit",style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold) ,),
          )
         ],
    ),

    body:Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              
              Container(
                height: 140,
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.end,
                  children: [
                 CircleAvatar(
                   maxRadius: 65,
                   backgroundColor: Colors.white,
                   child: CircleAvatar(
                     maxRadius: 60,
                     
                    
                 /* child:image==null? Image.network(''):
                  Image.file(image!) */
                    backgroundImage: NetworkImage('https://themefam.com/wp-content/uploads/2019/09/no-image-baby.png'),
                  ),
                 ),
                 
                  ],
                ),
                
              ),
              Expanded(
                
              child: SingleChildScrollView(
                child: Container(
                  width: 330,
                  
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  color: Colors.white,
                  child: Column(
                    
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                       textfield(hintText: "Patientname",
                           controller: _firstnameController,
                           
                           obscureText: false,
                         //  controller:firstname 
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           textfield(hintText: "Address",
                           controller: _firstnameController,
                           
                           obscureText: false,
                         //  controller:firstname 
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           textfield(hintText: "CNIC",
                           controller: _firstnameController,
                           
                           obscureText: false,
                         //  controller:firstname 
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           textfield(hintText: "Email",
                           controller: _lastnameController,
                           obscureText: false,
                         //  controller: lastname
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           textfield(hintText: "Phonenumber",
                           controller: _emailController,
                           obscureText: false,
                          // controller: email
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           textfield(hintText: "Password",
                           controller: _passController,
                           obscureText: true,
                          // controller: password
                           ),
                   
                  Container(
                     margin: EdgeInsets.only(top:25),
                       width: 250,
                       height: 50,
                  child:  RaisedButton(
                        // splashColor: Colors.red,
                       elevation: 7,
                         color: Colors.blue,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30),
                          
                           
                           ), onPressed: () {  },
                           child: Text("Update",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight:FontWeight.bold,shadows: [
                          Shadow(
                  blurRadius: 13.0,
                  color: Colors.grey,
                  offset: Offset(5.0, 5.0),
                  ),
                     ]),),
                    )
                  )
                    ],
                  ),
                ),
              ))
            ],
          ),
              Positioned(
                top: 100,
                left: 200,
            child: CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.white,
              child: IconButton(onPressed:(){
                getImage();
              }, icon: Icon(Icons.edit,color: Colors.black,))
            ),
          )
        ],
      ),
    ),
  );
  }} 


