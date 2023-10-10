
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up_page/Bloc/userjson/bloc/user_json_bloc.dart';
import 'package:sign_up_page/model%20copy/usermodel.dart';
import 'package:sign_up_page/user_widget.dart';
import 'package:sign_up_page/widget%20copy/userwidget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
    @override
  void initState() {
   context.read<UserJsonBloc>()..add(UserJsonLoadingEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserJsonBloc, UserJsonState>(
      builder: (context, state) {
        if (state is UserJsonLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserJsonLoadedState) {
          List<UserJsonModel> userlist = state.userjsondata;
          return ListView.separated(
              itemBuilder: (context, index) {
                return UserWidget(
                  user: userlist[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: userlist.length);
        }
        if (state is UserJsonError) {
          final geterror = state as UserJsonError;
          return Text("${geterror.userJsonError}");
        }
        return Container();
      },
    );
  }
}
