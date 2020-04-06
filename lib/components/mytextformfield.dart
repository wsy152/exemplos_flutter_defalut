import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final bool senha;
  final TextEditingController ctrl;
  final FormFieldValidator<String> validar;
  final TextInputType tipoTeclado;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocus;

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
