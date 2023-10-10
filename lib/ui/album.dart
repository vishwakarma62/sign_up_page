
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up_page/Bloc/album/bloc/album_bloc.dart';
import 'package:sign_up_page/model%20copy/albummodel.dart';
import 'package:sign_up_page/widget%20copy/listtile%20copy.dart';

class AlbumData extends StatefulWidget {
  const AlbumData({
    super.key,
  });

  @override
  State<AlbumData> createState() => _AlbumDataState();
}

class _AlbumDataState extends State<AlbumData> {
  @override
  void initState() {
   context.read<AlbumBloc>()..add(albumLoadingevents());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(18),
        child: blocbody()),
    );
  }

  Widget blocbody() {
    return BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
      if (state is AlbumLoading) {
        print(state.runtimeType);
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is AlbumLoaded) {
        List<AlbumModel> albumlist = state.albumdata;
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTileWidgetAlbum(
                      data: albumlist[index],
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
                  itemCount: albumlist.length),
            ],
          ),
        );
      }
      if (state is AlbumError) {
        final geterror = state as AlbumError;
        return Text("${geterror.error}");
      }
      return Container();
    });
  }
}
