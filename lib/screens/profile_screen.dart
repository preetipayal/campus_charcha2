import 'package:campus_charcha/screens/editprofile_screen.dart';
import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        elevation: 0,
        title: Text(
          'My Profile',
          style: GoogleFonts.poppins(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            const SizedBox(height: 16),
            Text(
              'Preeti ',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'preeti@college.edu',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),
            _profileTile(Icons.person, 'Edit Profile',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));}),
            // _profileTile(Icons.lock, 'Change Password',(){}),
            // _profileTile(Icons.notifications, 'Notification Settings',(){}),
            // _profileTile(Icons.help_outline, 'Help & Support',(){}),
            // _profileTile(Icons.info_outline, 'About App',(){}),
            // _profileTile(Icons.logout, 'Logout',(){}, isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _profileTile(IconData icon, String title,VoidCallback ontap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
           
          ),
        ),
        onTap: ontap
      ),
    );
  }
}
