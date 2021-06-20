import 'package:flutter/material.dart';

class MainTela1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainTela1State();
  }
}

class MainTela1State extends State<MainTela1> {
  GlobalKey<FormState> formKey3 = new GlobalKey<FormState>();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  bool switchValue = false;
  bool switchValue1 = false;
  bool switchValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage('assets/images/avatar.png')))),
                    SizedBox(height: 15),
                    Text(
                      "Nome do Usuário",
                      style: TextStyle(fontSize: 80, fontFamily: 'Gameover'),
                    ),
                    SizedBox(height: 15),
                    Divider(
                      height: 20,
                      thickness: 4,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 20, color: Colors.pink, fontFamily: 'Play'),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "username@email.com",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Play'),
                    ),
                    SizedBox(height: 15),
                    Divider(
                      height: 20,
                      thickness: 1,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Gêneros Selecionados",
                      style: TextStyle(
                          fontSize: 20, color: Colors.pink, fontFamily: 'Play'),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Gêneros",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Play'),
                    ),
                    SizedBox(height: 15),
                    Divider(
                      height: 20,
                      thickness: 1,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Plataformas Selecionadas",
                      style: TextStyle(
                          fontSize: 20, color: Colors.pink, fontFamily: 'Play'),
                    ),
                    SizedBox(height: 3),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Form(
                        key: formKey3,
                        child: Column(
                          children: [
                            Text(
                              "PS4",
                              style: TextStyle(
                                fontFamily: 'Play',
                                fontSize: 18,
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
                                fontFamily: 'Play',
                                fontSize: 18,
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
                                fontFamily: 'Play',
                                fontSize: 18,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
