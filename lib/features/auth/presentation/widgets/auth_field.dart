// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObsecureText = false,
    this.suffixIcon = false,
  });

  final String hintText;
  final TextEditingController controller;
  final bool isObsecureText;
  final bool suffixIcon;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool _isObsecureText;

  @override
  void initState() {
    _isObsecureText = widget.isObsecureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObsecureText = !_isObsecureText;
                    });
                  },
                  icon: _isObsecureText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
              )
            : null,
      ),

      validator: (value) {
        if (value!.isEmpty) {
          return '${widget.hintText} is missing!';
        }
        return null;
      },
      obscureText: _isObsecureText,
    );
  }
}
