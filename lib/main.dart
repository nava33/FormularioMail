/**
 * Taller Flutter InforSanLuis - 2019
 *
 * Ejemplo para entrega Final del taller.
 *
 * La lógica de la apliación consiste en un formulario de tipo registro, los campos
 * solicitados son a elección de ustedes, se dan dos como ejemplo para que se
 * orienten en como es el formato.
 *
 * Una vez realizado el formulario se debe redirigir a una nueva pantalla que
 * muestre los datos ingresados al estilo de un perfil de usuario.
 *
 * En el codigo se encuentran comentarios marcados como TODO.
 * Estos comentarios indican donde es necesario completar código
 */


import 'package:flutter/material.dart';
import 'formulario.dart';

var bgColor = Color(0xFFE2EEE2);

void main() => runApp(
    MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.green,
        ),
        home: MyApp(),
    ),
);