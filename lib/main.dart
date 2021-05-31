import 'dart:convert';

import 'package:api_test/models/user.dart';
import 'package:api_test/services/read_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<User> items =[];

  void getData() async{
    UserRead ur  = new UserRead();
    final data = await ur.getUsersData();

    setState(() {
      items = parseUsers(data);
    });

  }

  List<User> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {

     // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: (items.length > 0)  ?

      ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title:Text( items[index].title),
            subtitle:Text( items[index].body,),
            trailing: Text(items[index].id.toString()),
            leading: Text(items[index].userId.toString()),
          );
        },
      ) :Text('loading'),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  
  // Widget CardList(String item){
  //   return Container(
  //     color: Colors.red,
  //     child: Text('${items[index]}'),
  //
  //   );
  // }
}
