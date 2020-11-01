import 'package:equatable/equatable.dart';

abstract class CarouselEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCarousel extends CarouselEvent {}

class ItemChanged extends CarouselEvent {
  final int index;

  ItemChanged({this.index});

  @override
  List<Object> get props => [index];
}
