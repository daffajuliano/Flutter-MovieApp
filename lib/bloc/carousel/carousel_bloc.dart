import 'package:bloc/bloc.dart';
import 'package:movee/bloc/carousel/carousel_event.dart';
import 'package:movee/bloc/carousel/carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc(CarouselState initialState) : super(initialState);

  @override
  Stream<CarouselState> mapEventToState(CarouselEvent event) async* {
    if (event is LoadCarousel) {
      yield CarouselLoaded(currentIndex: 0);
    }

    if (event is ItemChanged) {
      yield CarouselLoaded(currentIndex: event.index);
    }
  }
}
