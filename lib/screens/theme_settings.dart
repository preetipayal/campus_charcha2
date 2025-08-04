import 'package:campus_charcha/main.dart';
import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeSettings extends StatefulWidget {
  const ThemeSettings({super.key});

  @override
  State<ThemeSettings> createState() => _ThemeSettingsState();
}

class _ThemeSettingsState extends State<ThemeSettings> {
  bool isDarkMode=false;
  @override
  void initState() {
    super.initState();
    isDarkMode=themeNotifier.value==ThemeMode.dark;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: AppColors.accent,
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back),
        color: Colors.white,
        ) 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
              child:SwitchListTile(
                title: Text('Dark Mode',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),),
                value: isDarkMode, 
                onChanged: (value){
                  setState(() {
                    isDarkMode=value;
                    themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
                  });
                },
                activeColor: Colors.blueAccent,
                ),
                
            ),
          ],
        ),
      ),
    );
  }
}