
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up_page/Bloc/post/bloc/post_bloc.dart';
import 'package:sign_up_page/model%20copy/postmodel.dart';
import 'package:sign_up_page/widget%20copy/listtile%20copy%202.dart';




class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
    @override
  void initState() {
   context.read<PostBloc>()..add(PostLoadingEvent());
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
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is PostLoading) {
        return Center(child: CircularProgressIndicator());
      }

      if (state is PostLoaded) {
        List<PostModel> postlist = state.postdata;
        return ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTileWidgetPost(
                data: postlist[index],
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
            itemCount: postlist.length);
      }
      if (state is PostLoadingError) {
        final geterror = state as PostLoadingError;
        return Text("${geterror.error}");
      }
      return Container();
    });
  }
}
