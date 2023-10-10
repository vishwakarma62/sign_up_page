import 'package:flutter/src/material/expansion_panel.dart';

class AlbumModel {
  int? userId;
  int? id;
  String? title;

  AlbumModel({this.userId, this.id, this.title});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }


}
