import 'package:flutter/widgets.dart';

class User {

  String nome;
  String status;
  bool som;
  String imagem;
  List<Chat> chats;

  User({ Key key, this.nome, this.status, this.chats, this.som, this.imagem });

}

class Chat {

  String nome;
  String descricao;
  bool som;
  String imagem;
  List membros;

  Chat({ Key key, this.nome, this.descricao, this.membros, this.som, this.imagem });

}

class MockUser {

  List<Chat> _chats = <Chat>[
    new Chat(nome:'Maçonaria Branca', descricao: 'Grupo de amigos', som: false, imagem: 'images/pic0.jpg'),
    new Chat(nome:'Família', descricao: 'Grupo da família', som: false, imagem: 'images/pic1.jpg'),
    new Chat(nome:'Grupo de games', descricao: 'Grupo de amigos', som: false, imagem: 'images/pic2.jpg'),
    new Chat(nome:'Trabalho', descricao: 'Grupo de trabalho', som: false, imagem: 'images/pic3.jpg'),
    new Chat(nome:'Faculdade', descricao: 'Grupo de colegas', som: false, imagem: 'images/pic4.jpg'),
    new Chat(nome:'Boteco', descricao: 'Grupo de amigos', som: false, imagem: 'images/pic5.jpg'),
    new Chat(nome:'Almoço', descricao: 'Grupo de amigos', som: false, imagem: 'images/pic6.jpg'),
  ];

  User user(){
    return new User(nome: 'Tiago Pereira', imagem: 'images/pic7.jpg', chats: _chats, status: 'Sem tempo irmão');
  }

}
