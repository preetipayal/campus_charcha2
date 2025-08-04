import 'package:flutter/material.dart';
import 'package:campus_charcha/widgets/appcolors.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final String validatorText;
  final bool obscuretext;

  const CustomTextField({
    super.key,
    required this.keyboardType,
    required this.controller,
    required this.icon,
    required this.labelText,
    required this.validatorText,
    required this.obscuretext,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscuretext; 
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.obscuretext
          ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
      : null,
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.accent),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validatorText;
        }
        return null;
      },
    );
  }
}
