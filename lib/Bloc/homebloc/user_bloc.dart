import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sign_up_page/model%20copy/itemmodel.dart';
import 'package:sign_up_page/model%20copy/model.dart';


import '../../repo/repository.dart';



part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final MyRepository repository;
  UserBloc({required this.repository}) : super(UserLoadingState()) {
    on<UserLoadingEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await repository.fetchData();
        emit(UserLoadedState(userdata: users));
    
      } catch (e) {
        print(e);
        emit(UserErrorState(error: e.toString()));
      }
    });
    on<UseritemEvent>(useritemEvent);
  }

  FutureOr<void> useritemEvent(UseritemEvent event, Emitter<UserState> emit) {
    print("added");
    itemdata.add(event.item);
  }
}
