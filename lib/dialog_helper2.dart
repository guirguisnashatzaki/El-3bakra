
import 'package:flutter/material.dart';
import 'package:newproject/exit_confirmation_dialog2.dart';

class DialogHelper2 {
  List <String> teams;
  DialogHelper2({required this.teams});
  exit(context) => showDialog(context: context, builder: (context) => ExitConfirmationDialog2(teams: teams));
}