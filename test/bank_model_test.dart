import 'package:estilizacao_componentes/models/bank.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('BankModel deposit tests', () {
    test('BankModel, after deposit of 10 shoul change point to 10', () {
      final bank = BankModel();
      bank.deposit(10);
      expect(bank.points, 10);
    });
    test('BanckModel, after deposit should turn avalible in to 10', () {
      final bank = BankModel();
      bank.deposit(10);
      expect(bank.available, 10);
    });
    test('BanckModel, after deposit should turn earned in to 10', () {
      final bank = BankModel();
      bank.deposit(10);
      expect(bank.earned, 10);
    });
  });
  group('BankModel transfer tests', () {
  test('Banckmodel, after transfer of 10 should turn points in to 10', () {
    final bank = BankModel();
    bank.transfer(10);
    expect(bank.points, 10);
  });
  test('Banckmodel, after transfer of 10 should turn spent in to 10', () {
    final bank = BankModel();
    bank.transfer(10);
    expect(bank.spent, 10);
  });
  test('Banckmodel, after transfer of 10 should turn available in to -10', () {
    final bank = BankModel();
    bank.transfer(10);
    expect(bank.available, -10);
  });
  });
}
