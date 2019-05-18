import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'Model/Data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  Future<List<Data>> _getData() async{

    var mainUrl="https://jsonplaceholder.typicode.com/photos";

    var data = await http.get(mainUrl);
    var jsonData= json.decode(data.body);

    List<Data>listOf=[];

    for (var i in jsonData){
      Data data=new Data(i['id'], i['title'], i["url"], i["thumbnailUrl"]);
      listOf.add(data);
    }
    return listOf;

  }

  //random color genarator

  List<MaterialColor>_color=[Colors.orange,Colors.green,Colors.blue,Colors.purple,Colors
  .pink,Colors.amber];



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Complete Json Parsing "),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[

          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: ()=>debugPrint("Search")
          ),
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: ()=>debugPrint("Add")
          )
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
                accountName: new Text("Code With YDC"),
                accountEmail: new Text("ydc@gmail.com"),
              decoration: new BoxDecoration(
                color: Colors.deepOrange
              ),
            ),
            new ListTile(
              title: new Text("First Page"),
              leading: new Icon(Icons.search,color: Colors.green,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text("Second Page"),
              leading: new Icon(Icons.add,color: Colors.orange,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            new ListTile(

              title: new Text("Third Page"),
              leading: new Icon(Icons.title,color: Colors.red,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text("Fourth Page"),
              leading: new Icon(Icons.edit,color: Colors.brown,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text("Fifth Page"),
              leading: new Icon(Icons.print,color: Colors.yellow,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            new Divider(
             height: 5.0,
              color: Colors.black,
            ),
            new ListTile(
              title: new Text("Close"),
              leading: new Icon(Icons.close,color: Colors.red,),
              onTap: (){
                Navigator.of(context).pop();
              },
            )

          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
          
          new Container(
            margin: EdgeInsets.all(10.0),
            height: 250.0,
            child: new FutureBuilder(
                future: _getData(),
              builder: (BuildContext c,AsyncSnapshot snapshot){
                  
                  if(snapshot.data==null){
                    return Center(
                      child: new Text("Loading..."),
                    );
                  }else{
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext c,int index){
                        MaterialColor color=_color[index % _color.length];
                        return Container(
                          width: 150.0,
                          child: new Card(
                            elevation: 10.0,
                            child: new Column(
                              children: <Widget>[

                                new Image.network(snapshot.data[index].url,
                                height: 150.0,
                                  width: 150.0,
                                  fit: BoxFit.cover,
                                ),
                                new SizedBox(height: 5.0,),
                                new Container(
                                  child: new Row(
                                    children: <Widget>[
                                      
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new CircleAvatar(

                                          backgroundColor: color,
                                          child: new Text(snapshot.data[index].id.toString()),
                                          foregroundColor: Colors.white,
                                        ),
                                      ),
                                      new SizedBox(width: 5.0,),
                                      Container(
                                        width: 60.0,
                                        child: new Text(snapshot.data[index].title,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.orange
                                          ),
                                        ),
                                      )
                                      
                                    ],
                                  ),
                                )
                     

                              ],
                            ),
                          ),
                        );
                      }
                    );
                  }
                  
              }
            ),
          ),//end container....
          
          
        ],
      )

    );
  }
}

