import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_layout/mockUser.dart';

class Conversas extends StatelessWidget {
  final List<Chat> chats;
  Conversas({this.chats});

  @override
  Widget build(BuildContext context) {
    return  _contatosList();
  }

  Widget _contatosList() {
    return ListView.builder(
      itemBuilder: (_, int index) => new Column(
        children: <Widget>[
          new ListTile(
            leading: new CircleAvatar(
              backgroundImage: new AssetImage(chats[index].imagem),
            ),
            title: Text(chats[index].nome),
            subtitle: Text(chats[index].descricao),
          ),
          new Divider()
        ],
      ),
      itemCount: chats.length,
    );
  }
}
