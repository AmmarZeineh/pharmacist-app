import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
  });
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: TextStyle(color: Colors.black.withOpacity(0.8)),
      decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.search,
            size: 34,
          ),
          suffixIconColor: Colors.black,
          filled: true,
          fillColor: const Color(0xfff6f6f6),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          hintText: 'Search for medicine',
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.8), height: 2, fontSize: 19)),
    );
  }
}
