import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Input extends StatefulWidget {
  final String hintText;
  final dynamic onEditingComplete;
  final dynamic focusNode;
  final TextInputType textInputType;
  final dynamic controller;
  final bool required;

  const Input({
    required this.hintText,
    this.onEditingComplete,
    this.focusNode,
    this.textInputType = TextInputType.name,
    this.controller,
    this.required = false,
    Key? key,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: widget.controller,
        autocorrect: false,
        enableSuggestions: false,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty && widget.required) {
            return 'Campo obrigatório';
          } else {
            return null;
          }
        },
        onEditingComplete: widget.onEditingComplete,
        focusNode: widget.focusNode,
      );
    });
  }
}
