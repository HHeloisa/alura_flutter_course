# Flutter: Gerenciamento de estados complexos

Esse curso de Flutter me ensinou: 

-> O que é estado e gerenciadores de estados

-> Como instalar e utilizar o Provider como gerenciador de estados

-> Formular estados seguindo o conceito de single source of truth

-> Como organizar models que utilizam os conceitos do `change notifier`

-> Criar Widgets focados em estado e passagem de dados


## 🔨 Projeto: Client Control

O projeto do curso consiste em um gerenciamento de clientes de maneira que podemos cadastrar clientes, tipos de clientes e vincular os tipos cadastrados com os clientes utilizando abordagens de gerenciamento de estados.

![](./screenshot.png)

## ✔️ Técnicas e tecnologias

**Veja mais de perto o que aprendi sobre** :
- `Provider`: o que é o provider e o seu poder como gerenciador de estados.
- `Consumer`: Ler dados da única fonte da verdade através do Widget Consumer. 
- `Provider.of`: Entender como acessar valores de estado fora da árvore de Widgets.
- `ChangeNotifier`: Possibilita preparar uma model para trabalhar como única fonte da verdade.
- `notifyListeners()`: Notifica as escutas de alterações no estado e notifica ao componente o novo estado.
- `MultiProvider`: É responsável por prover um meio de gerenciar multiplos providers na árvore de Widgets do projeto.
- `Redux`: Conheci conceitos e princípios dos gerenciadores com base no Redux.
- `BloC`: Conheci como funciona a teoria dos gerenciadores que implementam o padrão BloC.



## 🛠️ Abrir e rodar o projeto

**Para executar este projeto você precisa:**

- Ter uma IDE, que pode ser o  [Android Studio](https://developer.android.com/) instalado na sua máquina
- Ter a [SDK do Flutter](https://docs.flutter.dev/get-started/install) na versão 3.0.0
