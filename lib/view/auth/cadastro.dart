import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupPageState();
  }
}

class SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  bool checkBoxValue = false;
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool switchValue = false;
  bool switchValue1 = false;
  bool switchValue2 = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment(0.0, 1.20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/avatar.png"),
                ),
              ),
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.pink[400],
                  borderRadius: BorderRadius.all(
                    Radius.circular(56),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 55,
                          fontFamily: 'Gameover',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 55,
                          fontFamily: 'Gameover',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // autofocus: true,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 55,
                          fontFamily: 'Gameover',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        "Selecione seus gêneros preferidos:",
                        style: TextStyle(
                          fontFamily: 'Play',
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Aventura",
                          style: TextStyle(
                            fontFamily: 'Gameover',
                            fontSize: 45,
                            color: Colors.black87,
                          ),
                        ),
                        Checkbox(
                          value: checkBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              checkBoxValue = value;
                            });
                          },
                        ),
                        Text(
                          "Multijogador",
                          style: TextStyle(
                            fontFamily: 'Gameover',
                            fontSize: 45,
                            color: Colors.black87,
                          ),
                        ),
                        Checkbox(
                          value: checkBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              checkBoxValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Battle Royale",
                              style: TextStyle(
                                fontFamily: 'Gameover',
                                fontSize: 45,
                                color: Colors.black87,
                              ),
                            ),
                            Checkbox(
                              value: checkBoxValue2,
                              onChanged: (bool value) {
                                setState(() {
                                  checkBoxValue2 = value;
                                });
                              },
                            ),
                            Text(
                              "Indie",
                              style: TextStyle(
                                fontFamily: 'Gameover',
                                fontSize: 45,
                                color: Colors.black87,
                              ),
                            ),
                            Checkbox(
                              value: checkBoxValue3,
                              onChanged: (bool value) {
                                setState(() {
                                  checkBoxValue3 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        "Selecione as plataformas(pode ser alterado no futuro):",
                        style: TextStyle(
                          fontFamily: 'Play',
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            "PS4",
                            style: TextStyle(
                              fontFamily: 'Gameover',
                              fontSize: 45,
                              color: Colors.black87,
                            ),
                          ),
                          Switch(
                              value: switchValue,
                              onChanged: (bool value) {
                                setState(() {
                                  switchValue = value;
                                });
                              }),
                          Text(
                            "PC",
                            style: TextStyle(
                              fontFamily: 'Gameover',
                              fontSize: 45,
                              color: Colors.black87,
                            ),
                          ),
                          Switch(
                              value: switchValue1,
                              onChanged: (bool value) {
                                setState(() {
                                  switchValue1 = value;
                                });
                              }),
                          Text(
                            "XBOX",
                            style: TextStyle(
                              fontFamily: 'Gameover',
                              fontSize: 45,
                              color: Colors.black87,
                            ),
                          ),
                          Switch(
                              value: switchValue2,
                              onChanged: (bool value) {
                                setState(() {
                                  switchValue2 = value;
                                });
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.pink[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: SizedBox.expand(
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "CADASTRAR",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Play",
                                  fontSize: 26,
                                  letterSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: Text("Cadastro Realizado!"),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: TextButton(
                        //autofocus: true,
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                            fontFamily: 'Gameover',
                            fontSize: 45,
                            color: Colors.black87,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context, false),
                      ),
                    ),
                  ],
                ),
              ),
            ),
<<<<<<< HEAD:lib/view/cadastro.dart
=======
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.pink[400],
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: SizedBox.expand(
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "CADASTRAR",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Play",
                          fontSize: 26,
                          letterSpacing: 4,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text("Cadastro Realizado!"),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
>>>>>>> 5d5d97723ae03a4a55c106ab31ba015cb4cea5b4:lib/view/auth/cadastro.dart
          ],
        ),
      ),
    );
  }
}
