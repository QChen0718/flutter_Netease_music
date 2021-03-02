import 'package:flutter/material.dart';

class MusicListPage extends StatefulWidget{
  @override
  _MusicListPageState createState() => _MusicListPageState();
}
class _MusicListPageState extends State<MusicListPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          '歌单广场',
        ),
      ),
      body: Container(),
    );
  }
}