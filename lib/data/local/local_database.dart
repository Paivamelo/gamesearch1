import 'dart:async';
import 'dart:io';
import 'package:gamesearch1/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLocalServer {
  // Criando singleton
  static DatabaseLocalServer helper = DatabaseLocalServer
      ._createInstance(); //objeto que auxilia a conexao com o bd
  DatabaseLocalServer._createInstance(); //construtor

  static Database _database; //objeto que permite o acesso ao banco de dados

  //nome das colunas e da tabela no banco de dados
  String userTable = "user_table";
  String colId = "id";
  String colEmail = "email";
  String colSenha = "senha";

  //checa se existe um bd - inicializa um bd
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    /*
      Esse banco de dados é na verdade um arquivo, portanto é necessário criar esse arquivo
    */
    Directory directory = await getApplicationDocumentsDirectory();
    String path =
        directory.path + "user.db"; //nome do banco de dados dentro do disco

    Database userDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb); //cria um bd
    return userDatabase;
  }

  //cria um bd
  _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $userTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colEmail TEXT, $colSenha TEXT)");
  }

  /* INSERT DELETE QUERY UPDATE */

  // INSERT
  Future<int> insertUser(User user) async {
    Database db = await this.database;
    int result = await db.insert(userTable, user.toMap());
    notify();
    return result;
  }

  // QUERY: retorna tudo o que tem no banco.
  Future<List<dynamic>> getUserList() async {
    Database db = await this.database;
    var userMapList = await db.rawQuery("SELECT * FROM $userTable");

    List<User> userList = [];
    List<int> idList = [];

    for (int i = 0; i < userMapList.length; i++) {
      User user = User.fromMap(userMapList[i]);
      userList.add(user);
      idList.add(userMapList[i]["id"]);
    }
    return [userList, idList];
  }

  // DELETE
  Future<int> deleteUser(int userId) async {
    Database db = await this.database;
    int result =
        await db.rawDelete("DELETE FROM $userTable WHERE $colId=$userId");
    notify();
    return result;
  }

  /*
    STREAM
  */

  //garante que a lista sera mandada para alguem
  notify() async {
    if (_controller != null) {
      var response = await getUserList();
      _controller.sink.add(response);
    }
  }

  Stream get stream {
    if (_controller == null) {
      _controller = StreamController();
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
