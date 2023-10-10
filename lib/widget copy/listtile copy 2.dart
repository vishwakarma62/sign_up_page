
import 'package:flutter/material.dart';
import 'package:sign_up_page/model%20copy/postmodel.dart';



class ListTileWidgetPost extends StatefulWidget {
  ListTileWidgetPost({super.key, required this.data});
  PostModel data;

  @override
  State<ListTileWidgetPost> createState() => _ListTileWidgetPostState();
}

class _ListTileWidgetPostState extends State<ListTileWidgetPost> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Text(
              "title:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            title: RichText(
                text: TextSpan(
                    text: "${widget.data.title}",
                    style: TextStyle(color: Colors.black))),
          ),
          ListTile(
            leading: Text("body",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            title:  RichText(
                text: TextSpan(
                    text: "${widget.data.body}",
                    style: TextStyle(color: Colors.black))),
          ),
        ],
      ),
    
    );
  }
}
