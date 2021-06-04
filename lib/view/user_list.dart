import 'package:gamesearch1/logic/manage_db/manage_db_event.dart';
//import 'package:gamesearch1/logic/manage_db/manage_local_db_bloc.dart';
import 'package:gamesearch1/logic/manage_db/manage_remote_db_bloc.dart';
import 'package:gamesearch1/logic/monitor_db/monitor_db_state.dart';
import 'package:gamesearch1/logic/monitor_db/monitor_db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserListState();
  }
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
      return getUserListView(state.userList, state.idList);
    });
  }

  ListView getUserListView(userList, idList) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, position) {
        return Card(
          color: Colors.pink.shade300,
          elevation: 5,
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_circle),
              ],
            ),
            title: Text(
              "\nDados do Usuário\n",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              "Email: " +
                  userList[position].email +
                  "\nSenha: " +
                  userList[position].senha +
                  "\n",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: GestureDetector(
              onTap: () {
                // BlocProvider.of<ManageLocalBloc>(context)
                // .add(DeleteEvent(userId: idList[position]));

                BlocProvider.of<ManageremoteBloc>(context)
                    .add(DeleteEvent(userId: idList[position]));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.delete),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
