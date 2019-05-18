import 'package:flutter/material.dart';
import 'Model/Data.dart';


class Detail extends StatefulWidget {

  Data data;

  Detail(this.data);

  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Detail Data"),
        backgroundColor: Colors.green,
      ),

      body: new ListView(
        children: <Widget>[

          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[


                new Image.network(widget.data.thumbnailUrl,
                height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                new SizedBox(height: 10.0,),

                new Text(widget.data.title,style: TextStyle(fontSize: 20.0),)


              ],
            ),
          )

        ],
      ),


    );
  }
}

