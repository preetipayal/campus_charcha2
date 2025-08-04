import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticeScreen extends StatelessWidget {
  final List<Map<String, String>> notices = [
    {
      'title': 'Exam Schedule Released',
      'date': 'July 29, 2025',
      'details': 'Mid-term exams will start from August 5th. Check your department notice board.',
    },
    {
      'title': 'Library Closure',
      'date': 'July 30, 2025',
      'details': 'Library will remain closed for maintenance on August 2nd.',
    },
    {
      'title': 'Fee Payment Deadline',
      'date': 'August 1, 2025',
      'details': 'Last date to submit semester fee is August 10th. Late fee will be charged after that.',
    },
  ];

  NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notices',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: AppColors.accent,
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back),color: Colors.white,) 

      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: notices.length,
        itemBuilder: (context, index) {
          final notice = notices[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(Icons.campaign_rounded, color: Colors.indigo, size: 30),
              title: Text(
                notice['title'] ?? '',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Text(
                    notice['date'] ?? '',
                    style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notice['details'] ?? '',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                ],
              ),
              onTap: () {
                // Future: Show full notice details or navigate to a detail screen
              },
            ),
          );
        },
      ),
    );
  }
}
