import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'block/post_block.dart';
import 'model/posts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {

  @override
  Widget build(BuildContext context) {
    myposts.fetchAllPost();

    return StreamBuilder(
        stream: myposts.myposts,
        builder: (context, AsyncSnapshot<Posts> snapshot) {
          if (snapshot.hasData) {
            return _buildPostScreen(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        }
    );
  }

    Container _buildPostScreen(Posts data){
        return Container(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildTitle(data.asosiyFaoliyat),
              _buildCoord(data.orgDirector),
              _buildMain(data.categoryTitle),
            ],
          ),
        );
    }


  Center _buildTitle(String name) {
    return Center(
      child: Text(
        "Weather in " + name,
        style:
        TextStyle(color: Color.fromRGBO(0, 123, 174, 100), fontSize: 40.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Column _buildCoord(String name) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Coord  "+name,
            style: TextStyle(
                color: Color.fromRGBO(0, 123, 174, 100), fontSize: 18.0),
          ),
        ),
      ],
    );
  }

  Column _buildMain(String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Main",
            style: TextStyle(
                color: Color.fromRGBO(0, 123, 174, 100), fontSize: 18.0),
          ),
        ),
        Text("Temperature: " + name),
        Text("Pressure: " + "38 Gradus"),
        Text("Humidity: " + "120 T"),
      ],
    );
  }

}

