
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up_page/Bloc/photoes/bloc/photos_bloc.dart';
import 'package:sign_up_page/model%20copy/PhotosModel.dart';
import 'package:sign_up_page/widget%20copy/photowidget.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
    @override
  void initState() {
   context.read<PhotosBloc>()..add(PhotosLoadedingEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(18),
        child: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            if(state is PhotosLoadedingState){
             return Center(child: CircularProgressIndicator(),);
            }
            if(state is PhotosLoadedState){
              final loaded=state as PhotosLoadedState;
              List<PhotosModel> photolist=loaded.photodata;
              return ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PhotosWidget(
                  data: photolist[index],
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    height: 8,
                  ),
                );
              },
              itemCount: photolist.length);
            }
            if(state is PhotosLoadedError){
              final geterror=state as PhotosLoadedError;
              return Text("${geterror.error}");
            }
            return Container();
            
          },
        ),
      ),
    );
  }
}
