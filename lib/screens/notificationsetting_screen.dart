import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool seminarNotifications = true;
  bool examAlerts = true;
  bool festUpdates = true;
  bool generalNotices = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        elevation: 0,
        title: Text(
          'Notification Settings',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back),
        color: Colors.white,
        ) ,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildSwitchTile(
            title: 'Seminar Notifications',
            value: seminarNotifications,
            onChanged: (val) => setState(() => seminarNotifications = val),
          ),
          _buildSwitchTile(
            title: 'Exam Alerts',
            value: examAlerts,
            onChanged: (val) => setState(() => examAlerts = val),
          ),
          _buildSwitchTile(
            title: 'Fest Updates',
            value: festUpdates,
            onChanged: (val) => setState(() => festUpdates = val),
          ),
          _buildSwitchTile(
            title: 'General Notices',
            value: generalNotices,
            onChanged: (val) => setState(() => generalNotices = val),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SwitchListTile(
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blueAccent,
      ),
    );
  }
}
