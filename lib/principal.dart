import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  
  final String title = 'WhatsApp';
  
  @override
  Widget build(BuildContext context) {


    return new MaterialApp(
      title: this.title,
      home: new HomeApp(title: this.title),
      theme: new ThemeData(
        primaryColor: Colors.teal[800],
      ),
    );
  }
}

class HomeApp extends StatefulWidget{

  final String title;

  HomeApp({Key key, this.title});

  @override
  State<StatefulWidget> createState() {
    return new HomeAppState();
  }
}

class HomeAppState extends State<HomeApp> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    this._tabController = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
        bottom: new TabBar(
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          onTap: (int index){

          },
          // labelPadding: EdgeInsets.only(left: 16, right: 15),
          labelPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.043, right: MediaQuery.of(context).size.width * 0.043),
          controller: _tabController,
          tabs: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.05,
              alignment: Alignment.center,
              child: new Tab(icon: Icon(Icons.camera_alt))),
            Container(
              width: MediaQuery.of(context).size.width * 0.23,
              alignment: Alignment.center,
              child: new Tab(text: 'CONVERSAS')),
            Container(
              width: MediaQuery.of(context).size.width * 0.15,
              alignment: Alignment.center,
              child: new Tab(text: 'STATUS')),
            Container(
              width: MediaQuery.of(context).size.width * 0.22,
              alignment: Alignment.center,
              child: new Tab(text: 'CHAMADAS')),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Center(child: Text('camera')),
          new Center(child: Text('conversa')),
          new Center(child: Text('status')),
          new Center(child: Text('chamadas')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
}

