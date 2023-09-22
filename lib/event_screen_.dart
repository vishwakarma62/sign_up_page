
import 'package:flutter/material.dart';
import 'package:sign_up_page/event_model.dart';
import 'package:sign_up_page/events_screen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Event> EventList=[
    Event(isLiked: true,Location_Image: "assets/icons/icons8-location-50.png",
        ImageURL: "assets/images/pexels-photo-2909367.webp",Date: "15 July",
        Tittle: "International band Mu..",
        Address: "36 Guilt Street London,UK"),
    Event(isLiked: true,Location_Image: "assets/icons/icons8-location-50.png",
        ImageURL: "assets/images/pexels-photo-2909367.webp",Date: "15 July",
        Tittle: "International band Mu..",
        Address: "36 Guilt Street London,UK"),
    Event(isLiked: false,Location_Image: "assets/icons/icons8-location-50.png",
        ImageURL: "assets/images/pexels-photo-2909367.webp",Date: "15 July",
        Tittle: "International band Mu..",
        Address: "36 Guilt Street London,UK"),
    Event(isLiked: true,Location_Image: "assets/icons/icons8-location-50.png",
        ImageURL: "assets/images/pexels-photo-2909367.webp",Date: "15 July",
        Tittle: "International band Mu..",
        Address: "36 Guilt Street London,UK"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(itemBuilder: (context,index){
              return EventsScreen(event: EventList[index]);
            }, separatorBuilder: (context,index){
              return SizedBox(height: 5,);
            }, itemCount: EventList.length),
          ),
        ),
      ),
    );
  }
}
