import 'package:gamesearch1/data/local/local_database.dart';
import 'package:gamesearch1/logic/manage_db/manage_db_event.dart';
import 'package:gamesearch1/logic/manage_db/manage_db_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageLocalBloc extends Bloc<ManageEvent, ManageState> {
  ManageLocalBloc() : super(InsertState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is DeleteEvent) {
      DatabaseLocalServer.helper.deleteUser(event.userId);
    } else if (event is SubmitEvent) {
      if (state is InsertState) {
        DatabaseLocalServer.helper.insertUser(event.user);
      }
    }
  }
}
