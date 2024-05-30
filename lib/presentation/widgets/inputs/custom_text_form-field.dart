import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      //borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(20),
    );

    return TextFormField(
      // obscureText: true, ESTO ES PARA QUE SE MUESTRE COMO SI FUERA CONSTRASEÑA
      //keyboardType: TextInputType.number, TIPO DE TECLADO
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder: border.copyWith(
              borderSide: BorderSide(color: colors.primary, width: 2)),
          isDense: true,
          errorBorder:
              border.copyWith(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder:
              border.copyWith(borderSide: BorderSide(color: Colors.red)),
          label: label != null ? Text(label!) : null,
          hintText: hint,
          focusColor: colors.primary,
          //icon: Icon(Icons.abc), // icono por fuera
          suffixIcon: Icon(Icons.abc), // icono por dentro
          errorText: errorMessage),
      obscureText: obscureText,
    );
  }
}
