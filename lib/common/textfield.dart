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
      TextFiledWidgetStyle(titleController: titleController, textFieldName: 'Title',),
      const SizedBox(
        height: 30,
      ),
    SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: TextFiledWidgetStyle(titleController: detailController, textFieldName: 'Details')),
    ]);
  }
}

class TextFiledWidgetStyle extends StatelessWidget {
  const TextFiledWidgetStyle({
    super.key,
    required this.titleController, required this.textFieldName,
  });

  final TextEditingController titleController;
   final String textFieldName ; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15,0,15,10),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffe5e7eb),
          borderRadius: BorderRadius.circular(12)
        ),
      
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
      
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            controller: titleController,
            decoration:  InputDecoration(
             
              hintText: textFieldName ,hintStyle: const TextStyle(fontWeight: FontWeight.w500 , letterSpacing: 1.5 ), fillColor: Color(0xffa1a1aa),
            border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
