import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/content_division.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class AccountPoints extends StatelessWidget {
  const AccountPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Pontos da conta",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const BoxCard(boxContent: _AccountPointsContent())
            ]));
  }
}

class _AccountPointsContent extends StatelessWidget {
  const _AccountPointsContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Pontos totais:',),
      Text(
        '3000',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: ContentDivision(),
      ),
      const Text('Objetivos:'),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            ColorDot(color: ThemeColors.accountPoints['red']),
            const SizedBox(
              width: 2,
            ),
            Text("Entrega grátis: 15000pts",
                style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            ColorDot(color: ThemeColors.accountPoints['blue']),
            const SizedBox(
              width: 2,
            ),
            Text(
              "1 mês de streaming: 30000pts",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    ]);
  }
}
