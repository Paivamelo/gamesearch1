import 'package:gamesearch1/data/webserver/remote_database.dart';
import 'package:gamesearch1/logic/manage_db/manage_db_event.dart';
import 'package:gamesearch1/logic/manage_db/manage_db_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageremoteBloc extends Bloc<ManageEvent, ManageState> {
  ManageremoteBloc() : super(InsertState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is DeleteEvent) {
      DatabaseRemoteServer.helper.deleteUser(event.userId);
    } else if (event is SubmitEvent) {
      if (state is InsertState) {
        DatabaseRemoteServer.helper.insertUser(event.user);
      }
    }
  }
}
