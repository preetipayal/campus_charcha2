
// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:campus_charcha/screens/eventdetails.dart';
import 'package:campus_charcha/screens/exam_screen.dart';
import 'package:campus_charcha/screens/fests_screen.dart';
import 'package:campus_charcha/screens/notice_screen.dart';
import 'package:campus_charcha/screens/notificationsetting_screen.dart';
import 'package:campus_charcha/screens/profile_screen.dart';
import 'package:campus_charcha/screens/seminars_screen.dart';
import 'package:campus_charcha/screens/theme_settings.dart';
import 'package:campus_charcha/ui/auth/login_screen.dart';
import 'package:campus_charcha/screens/about_screen.dart';
import 'package:campus_charcha/screens/help_suppor_screen.dart';
import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex =0;
  final PageController _pageController=PageController();
  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }
  AppBar _buildAppBar(){
    if(_currentIndex==0){
      return AppBar(
automaticallyImplyLeading: false,
        backgroundColor:  const Color.fromARGB(255, 88, 175, 215),
        title: const Text(
          'Home',
          style: TextStyle(
            color:Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        
      );
    }
    else if(_currentIndex==1){
      return AppBar(
        backgroundColor:  const Color.fromARGB(255, 88, 175, 215),
        title: const Text(
          'Events',
          style: TextStyle(
            color:Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      );
    }
    else if(_currentIndex==2){
      return AppBar(
        backgroundColor:  const Color.fromARGB(255, 88, 175, 215),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color:Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      );
    }
    else {
      return AppBar(
        backgroundColor:  const Color.fromARGB(255, 88, 175, 215),
        title: const Text(
          'Settings',
          style: TextStyle(
            color:Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:PageView(
        controller: _pageController,
        onPageChanged:(index) {
          setState(() {
            _currentIndex=index;
          });
        },
        children: [
          MainScreen(),
          EventScreen(),
          NotificationScreen(),
          MoreScreen()
        ]
      ),
        
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap:(index){
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve:Curves.easeInOut 
          );
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.accent,
        unselectedItemColor:  Colors.grey,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event),label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.notification_add),label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
        ]
      ),
    );
  }
}
//----------------------------------home---------------------------------------------------------//




class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardItems = [
      {
        'title': 'Exams',
        'icon': Icons.school_rounded,
        // 'color': Colors.deepPurpleAccent,
        'onTap':()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamScreen()))
      },
      {
        'title': 'Seminars',
        'icon': Icons.mic_none_rounded,
        // 'color': Colors.teal,
        'onTap':()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SeminarsScreen()))
        
      },
      {
        'title': 'Fests',
        'icon': Icons.celebration_rounded,
        // 'color': Colors.orangeAccent,
        'onTap':()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FestsScreen()))

      },
      {
        'title': 'Notices',
        'icon': Icons.notifications_active_rounded,
        // 'color': Colors.redAccent,
        'onTap':()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NoticeScreen()))

      },
      
    ];

    return Scaffold(
    
      
      body:Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: [
      Text(
        'Welcome to Campus Charcha!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(color: Colors.grey,thickness:1 ,),
      SizedBox(
        height: 250,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Image.asset('assets/college2.png', fit: BoxFit.cover),
        ),
      ),
       Divider(color: Colors.grey,thickness:1 ,),
      const SizedBox(height: 16),
      Expanded(
        child: GridView.builder(
          itemCount: cardItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = cardItems[index];
            return GestureDetector(
              onTap: item['onTap'] as VoidCallback,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      // backgroundColor: item['color'] as Color,
                      radius: 28,
                      child: Icon(
                        item['icon'] as IconData,
                        size: 28,
                        // color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['title'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )
    ],
  ),
),

    );
  }
}






//----------------------------------------------------event screen--------------------------------------------------//


class EventScreen extends StatelessWidget {
  EventScreen({super.key});

  final List<Map<String, String>> events = [
    {
      'title': 'Tech Fest 2025',
      'date': 'August 10, 2025',
      'location': 'Auditorium',
      'description': 'An annual technical festival with coding, robotics, and innovation challenges.'
    },
    {
      'title': 'Seminar on AI',
      'date': 'August 20, 2025',
      'location': 'Room 204',
      'description': 'A session with industry experts discussing the latest in AI and ML.'
    },
    {
      'title': 'Cultural Fest',
      'date': 'September 1, 2025',
      'location': 'Open Ground',
      'description': 'Dance, Music, Drama — all in one place. Let the culture shine!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(event['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${event['date']} • ${event['location']}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EventDetailScreen(
                      title: event['title']!,
                      date: event['date']!,
                      location: event['location']!,
                      description: event['description']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


//-----------------------------------notificaton screen-------------------------------------------//
class NotificationScreen extends StatelessWidget{
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Seminar on AI Ethics',
        'message': 'Join us at 10:00 AM in Hall A.',
        'time': 'Today, 9:00 AM'
      },
      {
        'title': 'Midterm Exam Schedule Released',
        'message': 'Check the Exams section for your timetable.',
        'time': 'Yesterday, 7:30 PM'
      },
      {
        'title': 'Fest Registrations Open',
        'message': 'Register before the 5th of August.',
        'time': '2 days ago'
      },
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.notifications_active, color: Colors.blue),
                title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['message']),
                    const SizedBox(height: 4),
                    Text(
                      item['time'],
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
                onTap: () {
                  // Optional: Navigate to a detail screen or handle tap
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
//----------------------------------------settings Screen--------------------------------------//
class MoreScreen extends StatefulWidget{
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}
class _MoreScreenState extends State<MoreScreen> {
 

  
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth =FirebaseAuth.instance;
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(height: 30),
            _profileTile(Icons.person, ' Profile',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));}),
            // _profileTile(Icons.lock, 'Change Password',(){}),
            _profileTile(Icons.notifications, 'Notification Settings',(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationSettingsScreen()));
            }),
            _profileTile(Icons.dark_mode_outlined, 'Theme Settings',(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ThemeSettings()));
            }),
            _profileTile(Icons.help_outline, 'Help & Support',(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpFaqScreen()));
            }),
            _profileTile(Icons.info_outline, 'About App',(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutScreen()));
            }),
            _profileTile(Icons.logout, 'Logout',(){
              auth.signOut().then((value){
            Navigator.pushReplacement(
               context,
              MaterialPageRoute(builder: (context)=>LoginScreen())
            );
          });
          }, isLogout: true),
        ],
      ),
    );
  }

Widget _profileTile(IconData icon, String title,VoidCallback ontap, {bool isLogout = false}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.red : Colors.blueAccent),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isLogout ? Colors.red : null,
          ),
          
        ),
        onTap: ontap
      ),
    );
  }
}
