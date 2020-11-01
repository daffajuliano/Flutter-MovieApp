import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movee/repository/top_rated_repository.dart';

import 'top_rated_event.dart';
import 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final TopRatedRepository topRatedRepository;

  TopRatedBloc({@required this.topRatedRepository})
      : assert(topRatedRepository != null),
        super(null);

  @override
  Stream<TopRatedState> mapEventToState(TopRatedEvent event) async* {
    if (event is LoadTopRated) {
      var topRatedData = await topRatedRepository.getTopRated();
      yield LoadedState(data: topRatedData);
    }
  }
}
