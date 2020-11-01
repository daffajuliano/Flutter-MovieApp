import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movee/bloc/popular/popular_event.dart';
import 'package:movee/bloc/popular/popular_state.dart';
import 'package:movee/repository/popular_repository.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final PopularRepository popularRepository;

  PopularBloc({@required this.popularRepository})
      : assert(popularRepository != null),
        super(null);

  @override
  Stream<PopularState> mapEventToState(PopularEvent event) async* {
    if (event is LoadPopular) {
      var popularData = await popularRepository.getPopular();
      yield LoadedState(data: popularData);
    }
  }
}
