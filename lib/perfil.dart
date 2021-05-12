import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  static const profileStyle1 =
      TextStyle(color: Color(0xFF464692), fontSize: 36.0);
  static const profileStyle2 =
      TextStyle(color: Color(0xFF464692), fontSize: 16.0);
  static const bgColor = Color(0xFFE2EEE2);
  final String _username;
  final String _email;

  Perfil(this._username, this._email);

  @override
  Widget build(BuildContext context) {
    // TODO: Mostrar todos los datos ingresados, se sugiere también incluir una imagen de perfil
    // TODO: Mejorar el diseño de la pagina.

    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil InforSanLuis 2019"),
        backgroundColor: Colors.green,
      ),
      body: ListView(children: [
        Container(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Row(children: <Widget>[
                  Text(
                    this._username,
                    style: profileStyle1,
                  ),
                ]),
              ),
              ListTile(
                title: Row(children: <Widget>[
                  Text(
                    this._email,
                    style: profileStyle2,
                  ),
                ]),
              ),
              Divider(),
            ],
          ),
        ),
      ]),
      backgroundColor: bgColor,
    );
  }
}
