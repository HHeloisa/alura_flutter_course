import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http.mocks.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
main(){
  final httpMock = MockBankHttp();

  testWidgets('Testing mockhttp dolarToReal', (tester) async {
  // atençaõ, nestes cenarios é importante criar uma variavel para armazenar o mock, e asism usar sempre o mesmo
  // aqui, se cada vez fosse chamado, sempre seria uma instancia diferente e ele nao ia encontrar o mesmo
  when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
  await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home(api: httpMock.dolarToReal()))));
  verify(httpMock.dolarToReal()).called(1);
  // verifica se alguma função foi chamada
  // nesse caso 1, pq é o primeiro teste, 
  //se fosse por utlimo, teria de contar quantas vezes é chamado ao longo dos testes
});
  testWidgets('My widget has text spent', (tester)async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home(api: httpMock.dolarToReal()))));
    // invocar o robo, para montar um widget, e entao passar ql é o widget
    // se o home herda informações dos seus pais, tem de lemrbar disso,
    // por isso, precisamos fazer o mesmoc caminho, que o widget tem

    final spentFinder = find.text("Spent");
    // vai procurar se existe um widget correspondente ao encontrado pelo finder.
    expect(spentFinder, findsOneWidget);
  });

  testWidgets('Find LinearProgressIndicator', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home(api: httpMock.dolarToReal()))));
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('Find AccountStatus', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home(api: httpMock.dolarToReal()))));
    expect(find.byKey(const Key('testKey')), findsOneWidget);
  });
  
  testWidgets('Find 5 BoxCard', (tester) async {
  when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
  await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home(api: httpMock.dolarToReal()))));
  expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } return false;
    }), findsNWidgets(5));
    // Esse matcher é por quantidade de widget
  });

  testWidgets('When tap deposit should upload earns in 10', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home(api: httpMock.dolarToReal()))));
    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));
    await tester.pumpAndSettle();
    // qunado testa ações, é preciso pedir pro tester atualizar as atividades do projeto, as atualizar a tela
    // o pump and Settle vai esperar tudo att
    expect(find.text("\$10.0"), findsOneWidget);
  });


// COM MOCKS
// 1. É PRECISO MOCKAR A CLASSE, ver arquivo bank_http.dart
// 2. rodar build_runner que vai "montar" a classe mock
// 3. na hora de montar o widget para ser testado, é preciso ~informar que algo deve estar sendo mockado
// 4. é preciso que o pai/mae do widget o informe se tem de montar um mock ou nao
// pra isso, vamos criar um novo parametro no widget filho, para poder receber a info se deve mandar o original ou o mock
// essa info tem de vir de onde precisa, as vezes do topo da arvore
// 5. stubs: é o duble que recebe uma resposta; é o valor que é retornado, que no mock precisa ser estabelecido




} 