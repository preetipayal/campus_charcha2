import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:campus_charcha/widgets/roundbutton.dart';
import 'package:campus_charcha/widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        elevation: 0,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              keyboardType: TextInputType.text,
              controller: nameController,
              icon: Icons.person,
              labelText: 'Name',
              validatorText: 'please enter your name',
              obscuretext: false,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              keyboardType: TextInputType.text,
              controller: emailController,
              icon: Icons.email_outlined,
              labelText: 'Email address',
              validatorText: 'please enter your email',
              obscuretext: false,
            ),
            const SizedBox(height: 16),
            RoundButton(
              tittle: 'Save',
              ontap: () {
                // You can now access updated values:
                print("Updated Name: ${nameController.text}");
                print("Updated Email: ${emailController.text}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
