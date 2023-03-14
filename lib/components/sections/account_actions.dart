import 'package:alubank/components/box_card.dart';
import 'package:flutter/material.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text("Ações da conta", style: Theme.of(context).textTheme.titleMedium,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(onTap: (){}, child: const BoxCard(boxContent: _AccountActionsContent(icon: Icon(Icons.account_balance_wallet), text: "Depositar"))),
            InkWell(onTap: (){}, child: const BoxCard(boxContent: _AccountActionsContent(icon: Icon(Icons.cached), text: "Transferir"))),
            InkWell(onTap: (){}, child: const BoxCard(boxContent: _AccountActionsContent(icon: Icon(Icons.center_focus_strong), text: "Ler"))),
          ],
        )
      ],
    ));
  }
}

class _AccountActionsContent extends StatelessWidget {
  const _AccountActionsContent({required this.icon, required this.text});
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    var smallWidth = MediaQuery.of(context).size.width <= 320 ? true : false;
    return Container(
      width: smallWidth ? 55 : 70,
      child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          icon, const SizedBox(height: 2), Text(text, style: smallWidth ? Theme.of(context).textTheme.bodySmall : Theme.of(context).textTheme.bodyMedium)
        ],),
    );
  }
}