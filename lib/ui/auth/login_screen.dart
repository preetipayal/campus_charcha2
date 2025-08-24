// ignore_for_file: use_build_context_synchronously

import 'package:campus_charcha/screens/forgotpassword_screen.dart';
import 'package:campus_charcha/screens/home_screen.dart';
import 'package:campus_charcha/ui/auth/signup_screen.dart';
import 'package:campus_charcha/utils/utils.dart';
import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:campus_charcha/widgets/roundbutton.dart';
import 'package:campus_charcha/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  void login(BuildContext context){
    setState(() {
      loading=true;
    });
    _auth.signInWithEmailAndPassword( 
      email: emailController.text.toString(),
      password: passwordController.text.toString()
      ).then((value){
        Utils().toastMessage(value.user!.email.toString());
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context)=>Homescreen())
        );
        setState(() {
          loading=false;
        });
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Welcome Back!',
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
                  child: RoundButton(tittle: 'Login',
                  loading: loading,
                   ontap: (){
                      if(_formkey.currentState!.validate()){
                    login(context);                
                    }
                  }
                    )
                ),
            
                const SizedBox(height: 20),
            
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppColors.accent),
                    ),
                  ),
                ),
            
                SizedBox(height:200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                      },
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(color:AppColors.accent),
                      ),
                    ),
                  ],
                ),
            
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


