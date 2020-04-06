import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  String label;
  String hint;
  bool senha = false;
  TextEditingController ctrl;
  FormFieldValidator<String> validar;
  TextInputType tipoTeclado;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  MyTextFormField(
    this.label,
    this.hint, {
    this.senha = false,
    this.ctrl,
    this.validar,
    this.tipoTeclado,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      validator: validar,
      keyboardType: tipoTeclado,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: TextStyle(fontSize: 25),
      obscureText: senha,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 20),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 20)),
    );
  }
}
