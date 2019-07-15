import 'package:flutter/material.dart';
import 'package:whatsapp_layout/conversas.dart';
import 'package:whatsapp_layout/mockUser.dart';
import 'custom_material_localization.dart';

// void main() => runApp(
//   new MaterialApp(
//       localizationsDelegates:[
//         CustomMaterialLocalizationsDelegate()
//       ],
//       title: 'Search',
//       home: new MyApp(),
//   )
// );

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: Text('data'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showSearch(
//                 context: context,
//                 delegate: CustomSearchDelegate(),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text('data'),
//       ),
//     );
//   }
// }

class CustomSearchDelegate extends SearchDelegate {
  final List<Chat> chats = new MockUser().user().chats;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ? chats
        : chats.where((p) => p.nome.toUpperCase().startsWith(query.toUpperCase())).toList();
    return Conversas(chats: suggestionList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? chats
        : chats.where((p) => p.nome.toUpperCase().startsWith(query.toUpperCase())).toList();
    return Conversas(chats: suggestionList);
  }
}
