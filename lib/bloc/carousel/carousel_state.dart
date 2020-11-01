import 'package:equatable/equatable.dart';

abstract class CarouselState extends Equatable {
  @override
  List<Object> get props => [];
}

class CarouselInitial extends CarouselState {}

class CarouselLoaded extends CarouselState {
  final int currentIndex;

  CarouselLoaded({this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}
