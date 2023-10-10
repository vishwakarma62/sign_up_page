import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up_page/Bloc/album/bloc/album_bloc.dart';
import 'package:sign_up_page/Bloc/bloc/test_bloc.dart';
import 'package:sign_up_page/Bloc/conduit/conduit_bloc.dart';
import 'package:sign_up_page/Bloc/homebloc/user_bloc.dart';
import 'package:sign_up_page/Bloc/login/bloc/login_bloc.dart';
import 'package:sign_up_page/Bloc/photoes/bloc/photos_bloc.dart';
import 'package:sign_up_page/Bloc/post/bloc/post_bloc.dart';
import 'package:sign_up_page/Bloc/signupbloc/bloc/sign_up_bloc.dart';
import 'package:sign_up_page/Bloc/userjson/bloc/user_json_bloc.dart';
import 'package:sign_up_page/drawer.dart';
import 'package:sign_up_page/event_screen_.dart';
import 'package:sign_up_page/events_screen.dart';
import 'package:sign_up_page/login_page.dart';
import 'package:sign_up_page/pop_up.dart';
import 'package:sign_up_page/repo/loginrepo.dart';
import 'package:sign_up_page/repo/repository.dart';
import 'package:sign_up_page/user_screen.dart';
import 'package:sign_up_page/user_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(repo: AuthImpl()),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(signUpRepository: AuthImpl()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              UserBloc(repository: MyRepository())..add(UserLoadingEvent()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              AlbumBloc(albumrepository: AlbumRepository())
                ..add(albumLoadingevents()),
        ),
        BlocProvider(
          create: (BuildContext context) => TestBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              PostBloc(PostRepository()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              PhotosBloc(PhotosRepository()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              ConduitBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              UserJsonBloc(UserJsonRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage(),
      ),
    );
  }
}
