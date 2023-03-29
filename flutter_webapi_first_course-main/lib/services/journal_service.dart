import 'dart:convert';
import 'dart:io';
import 'package:flutter_webapi_first_course/services/webclient.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webapi_first_course/models/journal.dart';


class JournalService {
  String url = WebClient.url;
  http.Client client = WebClient().client;
  static const String resource = "journals/";


  String getUrl() {
    return "$url$resource";
  }

  
  Future<bool> edit(String id, Journal journal, String token) async {
    journal.updatedAt = DateTime.now();
    String jsonJournal = json.encode(journal.toMap());

    var uri = Uri.parse("${getUrl()}$id");
    http.Response response = await client.put(
      uri,
      headers: {
        "Content-type": "application/json",
        'Authorization': "Bearer $token"
      },
      body: jsonJournal,
    );
    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidExecption();
      }
      throw HttpException(response.body);
    }
    return true;
  }

  Future<bool> register(Journal journal, String token) async {
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(Uri.parse(getUrl()),
        headers: {
          "Content-type": "application/json",
          'Authorization': "Bearer $token",
        },
        body: jsonJournal);
    if (response.statusCode != 201) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidExecption();
      }
      throw HttpException(response.body);
    }
    return true;
  }

  
  Future<List<Journal>> getAll(
      {required String id, required String token}) async {
    http.Response response = await client.get(
        Uri.parse("${url}users/$id/journals"),
        headers: {'Authorization': "Bearer $token"});
    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidExecption();
      }
      throw HttpException(response.body);
    }
    List<Journal> list = [];

    List<dynamic> listDynamic = json.decode(response.body);
    for (var jsonMap in listDynamic) {
      list.add(Journal.fromMap(jsonMap));
    }
    return list;
  }

  
  Future<bool> delete(String id, String token) async {
    http.Response response = await http.delete(Uri.parse("${getUrl()}$id"),
        headers: {'Authorization': "Bearer $token"});
    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidExecption();
      }
      throw HttpException(response.body);
    }
    return true;
  }
}

class TokenNotValidExecption implements Exception {}
