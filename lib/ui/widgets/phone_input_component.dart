import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/style.dart';

class PhoneInputComponent extends StatefulWidget {
  const PhoneInputComponent({
    Key? key,
    this.validator,
    required this.onChanged,
    required this.initialValue,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final FormFieldValidator<String?>? validator;
  final String initialValue;

  @override
  State<PhoneInputComponent> createState() => _PhoneInputComponentState();
}

class _PhoneInputComponentState extends State<PhoneInputComponent> {
  late MaskTextInputFormatter phoneMaskFormatter;
  final FocusNode phoneFocusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  String shadowText = "90 123-45-67";

  String updateShadowText(String currentText) {
    shadowText = "90 123-45-67";
    shadowText = shadowText.substring(currentText.length, shadowText.length);
    return currentText + shadowText;
  }

  @override
  void initState() {
    phoneMaskFormatter = MaskTextInputFormatter(
      mask: '+998 ## ###-##-##',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
    controller.text = phoneMaskFormatter.maskText(widget.initialValue);
    updateShadowText(widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    super.dispose();
  }

  bool isEmpty = true;
  bool isFull = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColors.black,
      controller: controller,
      inputFormatters: [phoneMaskFormatter],
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: true),
      focusNode: phoneFocusNode,
      onChanged: (String value) {
        value.isEmpty ? isEmpty = true : isEmpty = false;
        value.length > 16 ? isFull = true : isFull = false;
        setState(() {
          if (value.length == 12) {
            phoneFocusNode.unfocus();
          }
          widget.onChanged.call(value);
        });
      },
      validator: widget.validator,
      style: MyTextStyle.aeonikSemiBold.copyWith(
          color: MyColors.black, fontWeight: FontWeight.w600, fontSize: 16),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.phone,
          color: Color(0xFFB7B7B7),
        ),
        suffixIcon: isFull
            ? const Icon(
                Icons.done_all,
                color: Colors.green,
              )
            : null,
        hintText: "Phone number",
        contentPadding: EdgeInsets.only(left: 20.w).w,
        hintStyle: MyTextStyle.aeonikSemiBold
            .copyWith(color: MyColors.neutral4.withOpacity(0.6), fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF9F9F9),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFB5353)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF9F9F9)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  isEmpty ? const Color(0xFFF9F9F9) : const Color(0xFFFB5353)),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFB5353)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFB5353)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF9F9F9)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
