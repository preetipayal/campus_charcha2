import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FestsScreen extends StatelessWidget {
  final List<Map<String, String>> fests = [
    {
      'title': 'Tech Carnival 2025',
      'date': 'Sept 10, 2025',
      'location': 'Main Ground',
      'theme': 'Innovate & Elevate',
    },
    {
      'title': 'Cultural Fiesta',
      'date': 'Sept 24, 2025',
      'location': 'Auditorium Block A',
      'theme': 'Unity in Diversity',
    },
    {
      'title': 'Literature Fest',
      'date': 'Oct 5, 2025',
      'location': 'Library Hall',
      'theme': 'Power of Words',
    },
  ];

   FestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fests',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back),color: Colors.white,) ,
        centerTitle: true,
        backgroundColor: AppColors.accent,
        elevation: 1,
       
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: fests.length,
        itemBuilder: (context, index) {
          final fest = fests[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              leading: const Icon(Icons.celebration, color: Colors.deepOrange, size: 32),
              title: Text(
                fest['title'] ?? '',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Text(
                    fest['date'] ?? '',
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                  Text(
                    fest['location'] ?? '',
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                  Text(
                    'Theme: ${fest['theme']}',
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                ],
              ),
              onTap: () {
                // Navigate to fest detail page if needed
              },
            ),
          );
        },
      ),
    );
  }
}
