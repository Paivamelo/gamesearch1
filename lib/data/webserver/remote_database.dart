import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gamesearch1/model/feedback.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DatabaseRemoteServer {
  static DatabaseRemoteServer helper = DatabaseRemoteServer
      ._createInstance(); //objeto que auxilia a conexao com o bd
  DatabaseRemoteServer._createInstance(); //construtor

  String dataBaseUrl = "https://si700-gamesearch.herokuapp.com/feedbacks";

  Dio _dio = Dio();

  Future<List<dynamic>> getFeedbackList() async {
    Response response = await _dio.request(this.dataBaseUrl,
        options: Options(method: "GET", headers: {
          "Accept": "application/json",
        }));
    List<UserFeedback> feedbackList = [];
    List<int> idList = [];

    response.data.forEach((element) {
      UserFeedback feedback = UserFeedback.fromMap(element);
      feedbackList.add(feedback);
      idList.add(element["id"]);
    });

    return [feedbackList, idList];
  }

  Future<int> insertFeedback(UserFeedback feedback) async {
    await _dio.post(this.dataBaseUrl,
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode({
          "assunto": feedback.assunto,
          "feedbacktext": feedback.feedbacktext
        }));
    return 1;
  }

//Stream
  notify() async {
    if (_controller != null) {
      var response = await getFeedbackList();
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
  UserFeedback feedback = UserFeedback();
  feedback.assunto = "Victor@";
  feedback.feedbacktext = "123";
}
