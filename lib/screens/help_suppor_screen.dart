import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpFaqScreen extends StatelessWidget {
  const HelpFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.accent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Help & FAQs',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back),
        color: Colors.white,
        ) 
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _faqItem(
            question: 'How do I receive notifications?',
            answer: 'Make sure notifications are enabled in settings. You will receive alerts for seminars, exams, fests, and notices.',
          ),
          
          _faqItem(
            question: 'How often is the app updated?',
            answer: 'We aim to push updates monthly to improve user experience and fix issues.',
          ),
          _faqItem(
            question: 'Who can I contact for technical issues?',
            answer: 'You can reach out to campuspulse.support@college.edu for any help or support.',
          ),
        ],
      ),
    );
  }

  Widget _faqItem({required String question, required String answer}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          question,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Text(
              answer,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}
