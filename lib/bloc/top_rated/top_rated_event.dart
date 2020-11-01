import 'package:equatable/equatable.dart';

class TopRatedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTopRated extends TopRatedEvent {
  final int count;

  LoadTopRated({this.count});

  @override
  List<Object> get props => [];
}
