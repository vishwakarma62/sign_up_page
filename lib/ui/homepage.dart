
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up_page/model%20copy/model.dart';
import 'package:sign_up_page/widget%20copy/listtile.dart';

import '../Bloc/homebloc/user_bloc.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
  void initState() {
   context.read<UserBloc>()..add(UserLoadingEvent());
    super.initState();
  }
  var _selectedpageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: blocbody(),
    );
  }

  Widget blocbody() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserLoadedState) {
        List<UserModel> userlist = state.userdata;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                    itemCount: userlist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<UserBloc>()
                              .add(UseritemEvent(item: userlist[index]));
                        },
                        child: ListTileWidget(
                          data: userlist[index],
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      }if(state is UserErrorState){
        final geterror=state as UserErrorState;
        return Text("${geterror.error}");
      }if(state is Interneterrorstate){
        return Text("Internet error");
      }
      return Container();
    });
  }
}
