import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddNgo extends StatelessWidget {
  const AddNgo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(),
              CustomTextFormField(),
              CustomTextFormField(),
              CustomTextFormField(),
              CustomTextFormField(),
              CustomTextFormField(),
              CustomTextFormField(),
            ],
          ),
        ));
  }
}
