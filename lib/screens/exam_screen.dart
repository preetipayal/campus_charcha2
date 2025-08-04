import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamScreen extends StatelessWidget {
  final List<Map<String, String>> exams = [
    {
      'subject': 'Mathematics II',
      'date': 'Aug 10, 2025',
      'time': '10:00 AM - 1:00 PM',
      'venue': 'Room 204, Science Block',
    },
    {
      'subject': 'Physics I',
      'date': 'Aug 12, 2025',
      'time': '2:00 PM - 5:00 PM',
      'venue': 'Room 101, Main Hall',
    },
    {
      'subject': 'Computer Programming',
      'date': 'Aug 14, 2025',
      'time': '9:00 AM - 12:00 PM',
      'venue': 'Lab 3, CS Block',
    },
  ];

  ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exams',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color:Colors.white,
          ),
          
        ),
        centerTitle: true,
        backgroundColor: AppColors.accent,
        elevation: 1,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),color: Colors.white,),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(Icons.event_note_rounded, color: Colors.deepPurple, size: 32),
              title: Text(
                exam['subject'] ?? '',
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
                    'Date: ${exam['date']}',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
                  ),
                  Text(
                    'Time: ${exam['time']}',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
                  ),
                  Text(
                    'Venue: ${exam['venue']}',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
              onTap: () {
                // Optional: navigate to exam detail or show a dialog
              },
            ),
          );
        },
      ),
    );
  }
}
