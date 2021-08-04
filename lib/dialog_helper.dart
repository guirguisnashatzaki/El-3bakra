
import 'package:flutter/material.dart';
import 'package:newproject/exit_confirmation_dialog.dart';

class DialogHelper {
  late String question,answer;
  late int questionnum;
  DialogHelper({
    required this.answer,required this.question,required this.questionnum
  });
  exit(context) => showDialog(context: context, builder: (context) => ExitConfirmationDialog(answer: answer,question: question,questionnum: questionnum,));
}