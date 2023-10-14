// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/common/string.dart';
import 'package:note/common/textfield.dart';

import '../../data/repository/note_repository.dart';
import '../home/bloc/home_bloc.dart';

class DetailScreen extends StatelessWidget {
  final INoteRepository noterepository;

  const DetailScreen({super.key, required this.noterepository});
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return  Detail(
            noterepository: noterepository,
            titleController: titleController,
            detailController: detailController,
            homeStarted: HomeStarted(),
          );
        
      },
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.noterepository,
    required this.titleController,
    required this.detailController,
    required this.homeStarted,
  });
  final HomeStarted homeStarted;
  final INoteRepository noterepository;
  final TextEditingController titleController;
  final TextEditingController detailController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await noterepository.addOne(
                titleController.text, detailController.text);
            context.read<HomeBloc>().add(homeStarted);
            Navigator.pop(context);
          },
          label: const Text(StringText.newText)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: TextFieldWidget(
              titleController: titleController,
              detailController: detailController),
        ),
      ),
    );
  }
}



// Column(children: [
//           const SizedBox(
//             height: 80,
//           ),
//           SizedBox(
//             height: 50,
//             child: TextField(
//               controller: titleController,
//               decoration: InputDecoration(
//                   labelText: 'title',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12))),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           SizedBox(
//             height: 50,
//             child: TextField(
//               controller: detailController,
//               decoration: InputDecoration(
//                   labelText: 'detail',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12))),
//             ),
//           ),
//         ]),
