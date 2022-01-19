import 'package:flutter/material.dart';

// var mess_data={"UpperMess":{10,15},"NewMess":{7,13},"LowerMess":{}};
var upperMessCap=30;
var lowerMessCap=30;
var newMessCap=25;
var curUpperMess=21;
var curNewMess=19;
var curLowermess=11;

class Traffic extends StatelessWidget {
  const Traffic ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
      backgroundColor: Colors.blue[600],
        title: Text('Crowd Infromation'),  
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>
        [
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            color: Colors.grey[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>
            [ 
              Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 5)),
              Expanded(child: Icon(Icons.person,color: Colors.orange,size: 50,),
              flex: 1,
              ),
              Expanded(child: Text("Upper Mess",style:TextStyle(color: Colors.white,fontSize: 30)),
              flex: 3,
              ),
              Expanded(child: Text(curUpperMess.toString()+"/"+upperMessCap.toString(),style:TextStyle(color: Colors.white,fontSize: 30)))
            ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            color: Colors.grey[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>
             [ 
              Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 5)),
              Expanded(child: Icon(Icons.people,color: Colors.green,size: 50,),
              flex: 1,
              ),
              Expanded(child: Text("Lower Mess",style:TextStyle(color: Colors.white,fontSize: 30)),
              flex: 3,
              ),
              Expanded(child: Text(curLowermess.toString()+"/"+lowerMessCap.toString(),style:TextStyle(color: Colors.white,fontSize: 30)))
            ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            color: Colors.grey[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>
            [
              
              Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 5)),
              Expanded(child: Icon(Icons.people,color: Colors.yellow,size: 50,),
              flex: 1,
              ),
              Expanded(child: Text("New Mess",style:TextStyle(color: Colors.white,fontSize: 30)),
              flex: 3,
              ),
              Expanded(child: Text(curNewMess.toString()+"/"+newMessCap.toString(),style:TextStyle(color: Colors.white,fontSize: 30)))
            ],
            ),
          ),
        ],
      ),
    );
    
  }
}