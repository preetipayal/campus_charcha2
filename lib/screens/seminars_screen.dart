import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeminarsScreen extends StatelessWidget {
  final List<Map<String, String>> seminars = [
    {
      'title': 'AI in Healthcare',
      'date': 'Aug 18, 2025',
      'time': '10:00 AM',
      'venue': 'Seminar Hall A',
      'speaker': 'Dr. Neha Verma',
    },
    {
      'title': 'Cybersecurity Awareness',
      'date': 'Aug 22, 2025',
      'time': '2:00 PM',
      'venue': 'Block B - Hall 3',
      'speaker': 'Mr. Rajeev Sharma',
    },
    {
      'title': 'Blockchain for Beginners',
      'date': 'Aug 30, 2025',
      'time': '11:30 AM',
      'venue': 'Main Auditorium',
      'speaker': 'Ms. Priya Mehta',
    },
  ];

   SeminarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        centerTitle: true,
        elevation: 1,
        title: Text(
          'Seminars',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),
        ),
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back),color: Colors.white,)       
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: seminars.length,
        itemBuilder: (context, index) {
          final seminar = seminars[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              leading: const Icon(Icons.mic_rounded, size: 32, color: Colors.indigo),
              title: Text(
                seminar['title'] ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    '${seminar['date']} | ${seminar['time']}',
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                  Text(
                    seminar['venue'] ?? '',
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                  Text(
                    'Speaker: ${seminar['speaker']}',
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                ],
              ),
              onTap: () {
                // Navigate to Seminar detail page if needed
              },
            ),
          );
        },
      ),
    );
  }
}
