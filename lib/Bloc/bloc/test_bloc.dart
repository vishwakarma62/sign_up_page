
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sign_up_page/model%20copy/itemmodel.dart';
import 'package:sign_up_page/model%20copy/model.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(LoadState(loaddata: itemdata)) {
    on<LoadDataEvent>((event, emit) {
  
      emit(LoadState(loaddata: itemdata));
      
    
    });
  }
}
