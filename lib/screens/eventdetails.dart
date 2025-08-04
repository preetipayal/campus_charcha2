import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:campus_charcha/widgets/event_details_screen.dart';
import 'package:flutter/material.dart';


class EventDetailScreen extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String description;

  const EventDetailScreen({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: AppColors.accent,
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back),color: Colors.white,) 
      ),
      body: SingleChildScrollView(
        child: EventDetailWidget(
          title: title,
          date: date,
          location: location,
          description: description,
        ),
      ),
    );
  }
}
