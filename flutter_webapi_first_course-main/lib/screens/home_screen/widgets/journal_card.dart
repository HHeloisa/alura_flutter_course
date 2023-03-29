import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/screens/commom/confirmation_dialog.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import 'package:uuid/uuid.dart';

import '../../../helpers/logout.dart';

class JournalCard extends StatelessWidget {
  final Journal? journal;
  final DateTime showedDate;
  final Function refreshFunction;
  final int userId;
  final String token;
  const JournalCard(
      {Key? key,
      this.journal,
      required this.userId,
      required this.showedDate,
      required this.refreshFunction,
      required this.token})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (journal != null) {
      return InkWell(
        onTap: () {
          callAddJournalScreen(context, journal);
        },
        child: Container(
          height: 115,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
            ),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      border: Border(
                          right: BorderSide(color: Colors.black87),
                          bottom: BorderSide(color: Colors.black87)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      journal!.createdAt.day.toString(),
                      style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black87),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(WeekDay(journal!.createdAt).short),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    journal!.content,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    removeJournal(context);
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          callAddJournalScreen(context, journal);
        },
        child: Container(
          height: 115,
          alignment: Alignment.center,
          child: Text(
            "${WeekDay(showedDate).short} - ${showedDate.day}",
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  callAddJournalScreen(
    BuildContext context,
    Journal? journal,
  ) {
    Journal innerJournal = Journal(
        id: journal?.id ?? const Uuid().v1(),
        content: "",
        createdAt: showedDate,
        updatedAt: showedDate,
        userId: userId);

    Map<String, dynamic> map = {};
    if (journal != null) {
      map['is_editing'] = true;
      innerJournal = journal;
    } else {
      map['is_editing'] = false;
    }

    map['journal'] = innerJournal;

    Navigator.pushNamed(context, 'add-journal', arguments: map).then((value) {
      // quando voltar, then. entao faça algo, no caso, mostrar o scaffold
      if (value != null && value == true) {
        refreshFunction();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registro feito com sucesso")));
      }
    });
  }

  removeJournal(context) {
    JournalService service = JournalService();
    if (journal != null) {
      showConfirmationDialog(context,
              content:
                  "Deseja realmente remover este card do dia ${WeekDay(journal!.createdAt)}?",
              affirmativeOption: "Remover")
          .then((value) => {
                if (value != null && value == true)
                  {
                    service.delete(journal!.id, token).then((value) => {
                          if (value)
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Removido com sucesso'))),
                          refreshFunction()
                        })
                  }
              })
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
   
    //
  }
}
