// ignore_for_file: use_build_context_synchronously

import 'package:campus_charcha/screens/home_screen.dart';
import 'package:campus_charcha/utils/utils.dart';
import 'package:campus_charcha/widgets/roundbutton.dart';
import 'package:campus_charcha/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading=false;
  final _formkey=GlobalKey<FormState>();
 final emailController=TextEditingController();
 final passwordController=TextEditingController();
 final FirebaseAuth _auth=FirebaseAuth.instance;
 @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void singnUp (BuildContext context){
    setState(() {
      loading=true;
    });
    _auth.createUserWithEmailAndPassword( 
      email: emailController.text.toString(),
      password: passwordController.text.toString()
      ).then((value){
        setState(() {
          loading=false;
        });
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context)=>Homescreen())
        );
        
      }).onError((error,stackTrace){
        debugPrint(error.toString());
        Utils().toastMessage(error.toString());
        setState(() {
          loading=false;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 88, 175, 215),
        title: Text('CampusCharcha',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Hello Student',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 6),
              CustomTextField(keyboardType: TextInputType.emailAddress, 
               controller: emailController, 
                icon:Icons.email_outlined, 
                labelText: 'Email', 
                validatorText: 'Please enter a valid email', 
                obscuretext: false,
              ),
          
              SizedBox(height: 20),            
              
              CustomTextField(
                keyboardType: TextInputType.text, 
                controller: passwordController, 
                icon:Icons.password_outlined, 
                labelText: 'Password', 
                validatorText: 'Please enter password', 
                obscuretext: true
                ),
          
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 80,
                child: RoundButton(tittle: 'SignUp',
                loading: loading,
                 ontap: (){
                    if(_formkey.currentState!.validate()){
                    singnUp(context);               
                 }
      
                }
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}