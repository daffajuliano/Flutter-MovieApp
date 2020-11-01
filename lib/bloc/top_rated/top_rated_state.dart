import 'package:equatable/equatable.dart';
import 'package:movee/model/top_rated_model.dart';

class TopRatedState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends TopRatedState {}

class LoadingState extends TopRatedState {}

class LoadedState extends TopRatedState {
  final List<TopRatedModel> data;

  LoadedState({this.data});

  @override
  List<Object> get props => [data];
}
