import 'package:equatable/equatable.dart';
import 'package:movee/model/popular_model.dart';

class PopularState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends PopularState {}

class LoadingState extends PopularState {}

class LoadedState extends PopularState {
  final List<PopularModel> data;

  LoadedState({this.data});

  @override
  List<Object> get props => [data];
}
