// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sign_up_page/model%20copy/usermodel.dart';
import 'package:sign_up_page/repo/repository.dart';



part 'user_json_event.dart';
part 'user_json_state.dart';

class UserJsonBloc extends Bloc<UserJsonEvent, UserJsonState> {
  UserJsonRepository _userJsonRepository;
  UserJsonBloc(
    this._userJsonRepository,
  ) : super(UserJsonLoadingState()) {
    on<UserJsonEvent>((event, emit) async{
      emit(UserJsonLoadingState());
       try {
        final userjsons = await _userJsonRepository.fetchData();
        emit(UserJsonLoadedState(userjsondata: userjsons));
    
      } catch (e) {
        print(e);
        emit(UserJsonError(userJsonError: e.toString()));
      }
    });
  }
}
