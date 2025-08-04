import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:campus_charcha/widgets/roundbutton.dart';
import 'package:campus_charcha/widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController(text: 'Preeti');
  final TextEditingController emailController = TextEditingController(text: 'preeti@college.edu');
  final TextEditingController phoneController = TextEditingController(text: '+91 9876543210');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back),
        color: Colors.white,
        ) 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/pofile.png'),
            ),
            const SizedBox(height: 20),
            CustomTextField(keyboardType: TextInputType.text, controller: nameController, icon: Icons.person, labelText: 'Name', validatorText: 'please enter your name', obscuretext: false),
             SizedBox(height: 16),
            CustomTextField(keyboardType: TextInputType.text, controller: emailController, icon: Icons.email_outlined, labelText: 'Email address', validatorText: 'please enter your email', obscuretext: false),
             SizedBox(height: 16),
            CustomTextField(keyboardType: TextInputType.number, controller: phoneController, icon: Icons.phone_android_outlined, labelText: 'Phone Number', validatorText: 'please enter your Phone Number', obscuretext: false),
             SizedBox(height: 16),
            RoundButton(tittle: 'Save', ontap: (){}),
             
            
          ],
        ),
      ),
    );
  }

}