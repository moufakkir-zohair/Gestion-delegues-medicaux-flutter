import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_delegue/Pages-Admin/Delegue/Liste-Delegue.dart';
import 'package:gestion_delegue/Pages-Admin/Delegue/Modifier-Delegue.dart';
import 'package:http/http.dart' as http;


class Detail_Delegue extends StatefulWidget {
  final List list;
  final int index;
  Detail_Delegue({this.list , this.index});
  @override
  _Detail_DelegueState createState() => _Detail_DelegueState();
}

class _Detail_DelegueState extends State<Detail_Delegue> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  //Circular Image






  //Next Button
  Positioned Modifier() {
    return Positioned(
      bottom: 0.0,
      right: 40.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: RaisedButton(
            color: Color(0xff5c6bc0),
            child: new Text(
              "Modifier",
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            ),
            onPressed: ()=>Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context)=>Modifier_Delegue(list: widget.list,index:widget.index)),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
      ),
    );
  }


  void delete() async{
    var url ="http://192.168.1.67:80/Admin/Delegue/Delete_delegue.php";
    final response = await http.post(url,body:{
      "id": widget.list[widget.index]['id'],
    });
  }


  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Text("Vous voulez vraiment supprimer ce délégué!!!",style: TextStyle(color: Colors.red),),
      actions: <Widget>[
        MaterialButton(
          child: Text("Supprimer"),
          onPressed: () {
            delete();
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => Liste_Delegue()),
            );
          }
        ),



        MaterialButton(
          child: Text("Annuler"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),



      ],

    );
    showDialog(context: context,child: alertDialog);
  }




  //Back Button
  Positioned Supprimer_Delegue() {
    return Positioned(
      bottom: 0.0,
      left: 40.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: RaisedButton(
            color: Color(0xff5c6bc0),
            child: new Text(
              "Supprimer",
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            ),
            onPressed: () {
              confirm();
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
      ),
    );
  }

  //Center Widget
  Center profilePage() {
    return Center(

      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(

          width: 350.0,
          height: 350.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),

            gradient: new LinearGradient(
              colors: [
                const Color(0xff64ffda),
                const Color(0xff3949ab),
              ],
              begin: Alignment.centerRight,
              end: new Alignment(-1.0, -1.0),
            ),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),

                        child: Row(
                          children: <Widget>[
                            Icon(Icons.person,
                                color: Color(0xffffffff), size: 18.0),
                            SizedBox(width: 10.0),
                            InkWell(
                              child: Text(
                                "${widget.list[widget.index]['nom']} ${widget.list[widget.index]['prenom']}",
                                style: TextStyle(
                                    color: new Color(0xffffffff),
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),







                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.email,
                                color: Color(0xffffffff), size: 16.0),
                            SizedBox(width: 10.0),
                            InkWell(
                              child: Text(
                                "${widget.list[widget.index]['email']}",
                                style: TextStyle(
                                    color: new Color(0xffffffff),
                                    fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),





                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.phone,
                                color: Color(0xffffffff), size: 16.0),
                            SizedBox(width: 10.0),
                            InkWell(
                              child: Text(
                                "${widget.list[widget.index]['Numero_tele']}",
                                style: TextStyle(
                                    color: new Color(0xffffffff),
                                    fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),




                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.vpn_key,
                                color: Color(0xffffffff), size: 18.0),
                            SizedBox(width: 10.0),
                            InkWell(
                              child: Text(
                                "${widget.list[widget.index]['password']}",
                                style: TextStyle(
                                    color: new Color(0xffffffff),
                                    fontSize: 18.0),
                              ),

                            ),
                          ],
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }







  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title :Text("Détail de délégué"),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          //_myAppBar3(),
          Expanded(
            flex: 4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),

              child: Stack(
                children: <Widget>[
                  profilePage(),
                  ProfileImageWidget(),
                  Supprimer_Delegue(),
                  Modifier(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _myAppBar3() {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.tealAccent,
//        gradient: new LinearGradient(
//          colors: [
//            const Color(0xff662d8c),
//            const Color(0xffed1e79),
//          ],
//          begin: Alignment.centerRight,
//          end: new Alignment(-1.0, -1.0),
//        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {

//                          Navigator.of(context).push(
//                            MaterialPageRoute(
//                              builder: (BuildContext context)=>MyAccountsPage(),
//                            ),
//                          );

                        }),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text(
                      'Détail de délégué ',


                      style: TextStyle(
                        color: Colors.black,
                        //fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}


class ProfileImageWidget extends StatefulWidget {
  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  var height = 160.0;
  var width = 160.0;
  var shape = BoxShape.circle;

  void _changeShape() {
    setState(() {
      shape = BoxShape.rectangle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //top: -10.0,
      left: 80.0,
      child: GestureDetector(
        onTap: () {
          _changeShape();
        },
        child: Container(
          width: 180,
          height: 250,

          decoration: new BoxDecoration(
            shape: shape,
            image: new DecorationImage(
              image: new AssetImage('assets/images/delegue.png'),
              fit: BoxFit.cover,
            ),
          ),



        ),
      ),
    );
  }
}