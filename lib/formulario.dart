import 'package:flutter/material.dart';
import 'perfil.dart';

var bgColor = Color(0xFFE2EEE2);

class MyApp extends StatelessWidget {
    static const String _title = 'Formulario InforSanLuis 2019';

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: _title,
            home: Scaffold(
                appBar: AppBar(title: const Text(_title), backgroundColor: Colors.green,),
                body: InformSanLuis(),
                backgroundColor: bgColor,
            ),
        );
    }
}

class InformSanLuis extends StatefulWidget {
    InformSanLuis({Key key}) : super(key: key);

    @override
    _InformSanLuisState createState() => _InformSanLuisState();
}

class _InformSanLuisState extends State<InformSanLuis> {
    final _formKey = GlobalKey<FormState>();

    final FocusNode _usernameFocus = FocusNode();
    final FocusNode _emailFocus = FocusNode();

    var _username = '';
    var _email = '';

    var formStyle = TextStyle(color: Color(0xFF464692), fontSize: 24.0);

    var borderFocus = BorderRadius.circular(25.0);
    var borderUnFocus = BorderRadius.circular(5.0);
    var fillInput = Color(0xFFF2FEF2);

    @override
    Widget build(BuildContext context) {
        // ListView es usada para que la pantalla sea scrolleable
        return ListView(
            children:<Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                        children: <Widget>[
                            // Campo para el nombre de usuario
                            TextFormField(
                                // Todo: Validar si el valor ingresado es correcto
                                validator: (value) {
                                    return null;
                                },

                                // Estilo para el campo
                                decoration: InputDecoration(
                                    labelText: 'Nombre de usuario',
                                ),

                                // Indica el tipo de teclado que usará el campo
                                textInputAction: TextInputAction.next,

                                // Nombre del nodo que pertenece al campo
                                focusNode: _usernameFocus,

                                // Funcion que determina que sucede una vez que se indica que
                                // se ha completado el campo:
                                // El campo actual pierde el foco e indica el
                                // siguiente campo a tener foco
                                onFieldSubmitted: (term){
                                    _usernameFocus.unfocus();
                                    FocusScope.of(context).requestFocus(_emailFocus);
                                },

                                // Indica, en este caso, el color y tamaño de la fuente
                                style: formStyle,
                            ),

                            TextFormField(

                                //Valida si el valor ingresado es correcto en una
                                // función declarada más abajo para que sea más
                                // fácil de leer
                                validator: validateEmail,

                                // Estilo para el campo
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                ),

                                // Indica el tipo de teclado que usará el campo
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.done,

                                // Nombre del nodo que pertenece al campo
                                focusNode: _emailFocus,

                                // Funcion que determina que sucede una vez que se indica que
                                // se ha completado el campo:
                                // El campo actual pierde el foco e indica el
                                // siguiente campo a tener foco
                                onFieldSubmitted: (term){
                                    // Todo: Perder el foco en el campo y procesar los datos.
                                },

                                // Indica, en este caso, el color y tamaño de la fuente
                                style: formStyle,
                            ),

                            // Botón que llama a la funcion que controla los campos
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Center(
                                    child: RaisedButton(
                                        onPressed: () {
                                            //Todo: procesar los datos;
                                        },
                                        child: Text('Enviar'),
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ]
        );
    }

    // En caso que no exista ningún error, se navega a la proxima pantalla.
    // De no ser correctos los campos lo indica en cada uno.
    void processData(){
        if (_formKey.currentState.validate()) {
            // Procesar la informacion.
            _pushView();
        }
    }

    //Función que crea la nueva pantalla
    void _pushView() {
        // Todo: Navegación al perfil
    }

    String validateEmail(String value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
            return 'Ingrese un Email válido';
        else {
            _email = value;
            return null;
        }
    }
}