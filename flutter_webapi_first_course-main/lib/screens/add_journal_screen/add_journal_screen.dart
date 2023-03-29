import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/logout.dart';
import '../commom/confirmation_dialog.dart';

class AddJournalScreen extends StatelessWidget {
  AddJournalScreen({super.key, required this.journal, required this.isEditing});
  final Journal journal;
  final bool isEditing;

  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _contentController.text = journal.content;
    return Scaffold(
      appBar: AppBar(
        title: Text(WeekDay(journal.createdAt).toString()),
        actions: [
          IconButton(
              onPressed: () {
                registerJournal(context);
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          maxLines: null,
          minLines: null,
        ),
      ),
    );
  }

  registerJournal(context) {
    String content = _contentController.text;
    journal.content = content;
    JournalService service = JournalService();

    SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString("accessToken");

      if (token != null) {
        if (isEditing) {
          service
              .edit(journal.id, journal, token)
              .then((value) => Navigator.pop(context, value))
              .catchError(
            (onError) {
              logout(context);
            },
            test: (onError) => onError is TokenNotValidExecption,
          ).catchError(
            (error) {
              showConfirmationDialog(context, content: error.message);
            },
            test: (error) => error is HttpException,
          );
        } else {
          service
              .register(journal, token)
              .then((value) => Navigator.pop(context, value)
                  // o segundo argumento do navigator permite responder algo pra pagina que o chamou
                  )
              .catchError(
            (onError) {
              logout(context);
            },
            test: (onError) => onError is TokenNotValidExecption,
          ).catchError(
            (error) {
              showConfirmationDialog(context, content: error.message);
            },
            test: (error) => error is HttpException,
          );
        }
      }
    });
    
  }
}
