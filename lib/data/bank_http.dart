import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

//primeira parte para gerar o mock, colocando a classe que queremos gerarl
// precisar rodar o code_runner para ele gerar o mock
// atraves do codigo: flutter pub run build_runner build
@GenerateMocks([BankHttp])

class BankHttp {
  Future<String> dolarToReal() async {
    var url = Uri.http('economia.awesomeapi.com.br', '/last/USD-BRL');
    var response = await http.get(url);
    if (response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body) as Map<String,dynamic>;
      String value = jsonResponse['USDBRL']['high'];
      return value;
    } else{
      print('Não foi possível se conectar com a API: ${response.statusCode}');
      return '?';
    }
  }
}
