import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gamesearch1/model/feedback.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DatabaseRemoteServer {
  static DatabaseRemoteServer helper = DatabaseRemoteServer
      ._createInstance(); //objeto que auxilia a conexao com o bd
  DatabaseRemoteServer._createInstance(); //construtor

  //String dataBaseUrl = "http://192.168.100.70:3000/notes";
  String dataBaseUrl = "https://si700-gamesearch.herokuapp.com/users";

  Dio _dio = Dio();

  Future<List<dynamic>> getUserList() async {
    Response response = await _dio.request(this.dataBaseUrl,
        options: Options(method: "GET", headers: {
          "Accept": "application/json",
        }));
    List<User> userList = [];
    List<int> idList = [];

    response.data.forEach((element) {
      element["dataLocation"] = 2;
      User user = User.fromMap(element);
      userList.add(user);
      idList.add(element["id"]);
    });

    return [userList, idList];
  }

  Future<int> insertUser(User user) async {
    await _dio.post(this.dataBaseUrl,
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode({"email": user.email, "senha": user.senha}));
    return 1;
  }

  Future<int> deleteUser(int userId) async {
    await _dio.delete(this.dataBaseUrl + "/$userId",
        options: Options(method: "GET", headers: {
          "Accept": "application/json",
        }));
    return 1;
  }

//Stream
  notify() async {
    if (_controller != null) {
      var response = await getUserList();
      _controller.sink.add(response);
    }
  }

  Stream get stream {
    if (_controller == null) {
      _controller = StreamController();

      Socket socket = io(
          //"http://192.168.100.70:3000",
          "https://si700-gamesearch.herokuapp.com/",
          OptionBuilder().setTransports(['websocket']).build());

      socket.on('invalidate', (_) => notify());
    }
    return _controller.stream.asBroadcastStream();
  }

  dispose() {
    if (!_controller.hasListener) {
      _controller.close();
      _controller = null;
    }
  }

  static StreamController _controller;
}

void main() async {
  DatabaseRemoteServer noteService = DatabaseRemoteServer.helper;

/*  var response = await noteService.getUserList();
 User user = response[0][0];

  print(user.email);
*/
  User user = User();
  user.email = "Victor@";
  user.senha = "123";
  noteService.deleteUser(1);
}
