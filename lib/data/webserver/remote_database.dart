import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:gamesearch1/models/feedback.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DatabaseRemoteServer {
  /* 
    Criando singleton
  */
  static DatabaseRemoteServer helper = DatabaseRemoteServer._createInstance();
  DatabaseRemoteServer._createInstance();
  String databaseUrl = "https://si700-gamesearch.herokuapp.com/feedbacks";

  Dio _dio = Dio();

  Future<List<dynamic>> getFeedbackList() async {
    Response response = await _dio.request(this.databaseUrl,
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

  Future<int> insertNote(UserFeedback feedback) async {
    await _dio.post(this.databaseUrl,
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode({
          "assunto": feedback.assunto,
          "feedbacktext": feedback.feedbacktext
        }));
    return 1;
  }

  /*
    STREAM
  */
  notify() async {
    if (_controller != null) {
      var response = await getFeedbackList();
      _controller.sink.add(response);
    }
  }

  Stream get stream {
    if (_controller == null) {
      _controller = StreamController.broadcast();

      Socket socket = io(
          //http://192.168.15.14:3000",
          "https://si700-gamesearch.herokuapp.com/",
          OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
              .build());
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
  feedback.assunto = "Assunto Teste";
  feedback.feedbacktext = "Feedback";
}
