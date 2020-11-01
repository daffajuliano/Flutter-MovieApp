import 'package:equatable/equatable.dart';

class UpcomingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadUpcoming extends UpcomingEvent {
  final int count;

  LoadUpcoming({this.count});

  @override
  List<Object> get props => [];
}
