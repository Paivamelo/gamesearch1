/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamesearch1/auth_provider/firebase_auth.dart';

class FirebaseRemoteServer {
  static String uid;
  static FirebaseRemoteServer helper = FirebaseRemoteServer._createInstance();
  FirebaseRemoteServer._createInstance();

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("user");

  Future<List<dynamic>> getUserList() async {
    QuerySnapshot snapshot = await userCollection.doc(uid).collection("my_user").get();

  }

   insertUser(User user) async {
      await userCollection.doc(uid).collection("my_user").add({
         "email": user.email, "senha": user.password
      });

  }

  Future<int> deleteUser(int userId) async {}
}
*/