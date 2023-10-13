import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.titleController,
    required this.detailController,
  });

  final TextEditingController titleController;
  final TextEditingController detailController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 80,
      ),
      SizedBox(
        height: 90,
        child: TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          controller: titleController,
          decoration: const InputDecoration(
              labelText: 'title', border: InputBorder.none),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      SizedBox(
        height: 90,
        child: TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          controller: detailController,
          decoration: const InputDecoration(
              alignLabelWithHint: true,
              labelStyle: TextStyle(),
              labelText: 'detail',
              border: InputBorder.none),
        ),
      ),
    ]);
  }
}
