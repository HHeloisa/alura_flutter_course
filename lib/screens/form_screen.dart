import 'package:flutter/material.dart';
import 'package:task_project/constants.dart';
import 'package:task_project/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

// sobre contexto:
// apenas a home esta ligada diretamente ao inheritedWidget. Isso quer dizer que outras paginas, como esta, nao tem acesso a ele
// para permitir este acesso, o contexto da pagina (no caso a home) precisa ser passado pra pagina seguinte, na hora da navegação
// a nova pagina obviamente precisa receber este contexto, e, ao se referir ao InheritedWidget, deve fornecer este conxto, o que tem os dados
class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (valueValidator(value)) {
      if ((int.parse(value!) < 5) && (int.parse(value) > 0)) {
        return true;
      }
    }
    return false;
  }
  // A _formKey é a variavel que armazena a chave do formulario. Ela é a responsavel por disponibilizar acesso
  // as infos, como contexto e conteudo. É utilizada no botão que envia o formulário: _formKey.currentState!.validate()
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(newTask),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2),
              ),
              height: 650,
              width: 375,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (!valueValidator(value)) {
                          return "Insira o nome da tarefa";
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "nome",
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (!difficultyValidator(value)) {
                          return "Insira a dificuldade de 1 a 5";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "dificuldade (1-5)",
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.url,
                      onChanged: (text) => {setState((() {}))},
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "imagem",
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(imageController.text, errorBuilder:
                          (BuildContext context, Object exception,
                              StackTrace? stacktrace) {
                        return Image.asset("assets/images/nophoto.png");
                      }, fit: BoxFit.cover),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // passa por parametro de contexto, o contexto recebido pela pagina, o contexto no qual contem o inherited, a tasklist
                          TaskInherited.of(widget.taskContext).newTask(
                              nameController.text,
                              int.parse(difficultyController.text),
                              imageController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Registrando novo conhecimento")));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Adicionar"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
