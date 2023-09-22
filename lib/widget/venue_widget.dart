
import 'package:flutter/material.dart';
import 'package:sign_up_page/model/venue_model.dart';

class VenueWidget extends StatefulWidget {
   VenueWidget({super.key,required this.venueModel});
  VenueModel venueModel;

  @override
  State<VenueWidget> createState() => _VenueWidgetState();
}

class _VenueWidgetState extends State<VenueWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 240,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "${widget.venueModel.imgUrl}",
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child:  Column(
                children: [
                  Text(
                    "${widget.venueModel.name}",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
