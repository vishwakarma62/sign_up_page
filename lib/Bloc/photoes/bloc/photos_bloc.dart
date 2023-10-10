// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sign_up_page/model%20copy/PhotosModel.dart';
import 'package:sign_up_page/repo/repository.dart';



part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosRepository photosRepository;
  PhotosBloc(
    this.photosRepository,
  ) : super(PhotosLoadedingState()) {
    on<PhotosLoadedingEvent>((event, emit) async{
      emit(PhotosLoadedingState());

      try {
        final photos = await photosRepository.fetchData();
        emit(PhotosLoadedState(photodata: photos));
    
      } catch (e) {
        print(e);
        emit(PhotosLoadedError(error: e.toString()));
      }
    });
  }
}
