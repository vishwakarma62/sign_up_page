import 'package:flutter/material.dart';
import 'package:sign_up_page/Appcolor.dart';
import 'package:sign_up_page/model/venue_model.dart';
import 'package:sign_up_page/widget/venue_widget.dart';

class VanueSelection extends StatefulWidget {
  const VanueSelection({super.key});

  @override
  State<VanueSelection> createState() => _VanueSelectionState();
}

class _VanueSelectionState extends State<VanueSelection> {
  var screensize;
  final location = TextEditingController();
  List<VenueModel> venuemodel=[
    VenueModel(id: "1", imgUrl: "assets/icons/ic_invite_friend.png", name: "Grant Fuhr Arena Endmonton,AB"),
    VenueModel(id: "2", imgUrl: "assets/icons/ic_invite_friend.png", name: "Grant Fuhr Arena Endmonton,AB"),
    VenueModel(id: "2", imgUrl: "assets/icons/ic_invite_friend.png", name: "Grant Fuhr Arena Endmonton,AB"),
    VenueModel(id: "2", imgUrl: "assets/icons/ic_invite_friend.png", name: "Grant Fuhr Arena Endmonton,AB"),
  ];
  @override
  Widget build(BuildContext context) {
    screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/icons/ic_first_grid.png"),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Vanue Selection",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 62,
                ),
                Container(
                  width: 340,
                  height: 45,
                  padding: EdgeInsets.only(left: 28, right: 9),
                  child: TextFormField(
                    controller: location,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        prefixIcon: SizedBox(
                            width: 10,
                            height: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset("assets/icons/ic_search.png"),
                            )),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        hintText: "Enter Location",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        filled: true,
                        fillColor: AppColor.lightwhite),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(itemBuilder: (context,index){
                    return VenueWidget(venueModel: venuemodel[index]);
                  }, separatorBuilder: (context,index){
                    return SizedBox(height: 10,);
                  }, itemCount: venuemodel.length),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
