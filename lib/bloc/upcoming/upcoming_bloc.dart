import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movee/repository/upcoming_repository.dart';

import 'upcoming_event.dart';
import 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final UpcomingRepository upcomingRepository;

  UpcomingBloc({@required this.upcomingRepository})
      : assert(upcomingRepository != null),
        super(null);

  @override
  Stream<UpcomingState> mapEventToState(UpcomingEvent event) async* {
    if (event is LoadUpcoming) {
      var upcomingData = await upcomingRepository.getUpcoming();
      yield LoadedState(data: upcomingData);
    }
  }
}
