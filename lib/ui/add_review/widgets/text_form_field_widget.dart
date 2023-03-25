import 'package:flutter/material.dart';
import 'package:open_work/utils/color.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({Key? key, required this.reviewController})
      : super(key: key);

  final TextEditingController reviewController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: reviewController,
      maxLines: 6,
      textInputAction: TextInputAction.done,
      maxLength: 250,
      decoration: const InputDecoration(
        hintText: 'Tell people about your experience',
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a review';
        }
        return null;
      },
    );
  }
}
