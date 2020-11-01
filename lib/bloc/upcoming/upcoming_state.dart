import 'package:equatable/equatable.dart';
import 'package:movee/model/upcoming_model.dart';

class UpcomingState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends UpcomingState {}

class LoadingState extends UpcomingState {}

class LoadedState extends UpcomingState {
  final List<UpcomingModel> data;

  LoadedState({this.data});

  @override
  List<Object> get props => [data];
}
