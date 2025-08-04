import 'package:campus_charcha/utils/utils.dart';
import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:campus_charcha/widgets/roundbutton.dart';
import 'package:campus_charcha/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController=TextEditingController();
 final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        title: Text('Forgot Password',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              keyboardType: TextInputType.emailAddress, 
              controller: emailController, 
              icon: Icons.email, 
              labelText: 'Email', 
              validatorText: 'Please enter a valide email', 
              obscuretext: false
              ),
              SizedBox(height: 30,),
              RoundButton(tittle: 'Forgot password', ontap: (){
                _auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                  Utils().toastMessage('we have sent you an email to reset password, plese check');
        
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              })
          ],
        ),
      ),
    );
  }
}