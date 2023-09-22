import 'package:flutter/material.dart';
import 'package:sign_up_page/Appcolor.dart';
import 'package:sign_up_page/event_model.dart';

class EventsScreen extends StatefulWidget {
  EventsScreen({super.key,required this.event});
  Event event;

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  bool isliked=false;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.lb2,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 75,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "${widget.event.ImageURL}",
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${widget.event.Date}"),
                          Spacer(),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color:widget.event.isLiked? Colors.white : Colors.red,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/images/heart.png",fit: BoxFit.cover,
                                color:widget.event.isLiked ? Colors.red : Colors.white ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                        Text("${widget.event.Tittle}",style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    SizedBox(height: 2,),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 15,
                            child: Image.asset("${widget.event.Location_Image}",fit: BoxFit.fill,
                            color: AppColor.lightblack,),
                          ),
                          Text("${widget.event.Address}",style: TextStyle(color: AppColor.lightblack),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
