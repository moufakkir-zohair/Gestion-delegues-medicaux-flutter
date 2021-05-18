import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_delegue/Pages-Admin/Delegue/Liste-Delegue.dart';
import 'package:gestion_delegue/Pages-Admin/Docteur/Liste-Docteur.dart';
import 'package:http/http.dart' as http;


class Modifier_Docteur extends StatefulWidget{
  final List list;
  final int index;
  Modifier_Docteur({this.list,this.index});
  _Modifier_DocteurState createState()=> _Modifier_DocteurState();
}

class _Modifier_DocteurState extends State<Modifier_Docteur>{


  TextEditingController cnom = new TextEditingController();
  TextEditingController cprenom = new TextEditingController();
  TextEditingController cemail = new TextEditingController();
  TextEditingController ctele = new TextEditingController();
  TextEditingController cspe = new TextEditingController();
  TextEditingController cadd = new TextEditingController();
  void editDate() async{
    var url ="http://192.168.1.67:80/Admin/Docteur/Modifier_docteur.php";
    final response = await http.post(url,body:{
      "nom": cnom.text,
      "prenom":cprenom.text,
      "email":cemail.text,
      "Numero_tele":ctele.text,
      "specialite":cspe.text,
      "adresse":cadd.text,
      "id":widget.list[widget.index]['id'],
    });
  }


  void initState(){
    cnom=TextEditingController(text: widget.list[widget.index]['nom']);
    cprenom=TextEditingController(text: widget.list[widget.index]['prenom']);
    cemail=TextEditingController(text: widget.list[widget.index]['email']);
    ctele=TextEditingController(text: widget.list[widget.index]['Numero_tele']);
    cspe=TextEditingController(text: widget.list[widget.index]['specialite']);
    cadd=TextEditingController(text: widget.list[widget.index]['adresse']);
    super.initState();
  }


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title :Text("Modifier un docteur"),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body:ListView(
        children: <Widget>[
          imageProfile(),
          new ListTile(
            leading: const Icon(Icons.person,color: Colors.blue,),
            title: new TextField(
              controller: cnom,
              decoration: new InputDecoration(
                hintText: "Nom",
              ),
            ),
          ),

          new ListTile(
            leading: const Icon(Icons.person,color: Colors.blue,),
            title: new TextField(
              controller: cprenom,
              decoration: new InputDecoration(
                hintText: "Prenom",
              ),
            ),
          ),


          new ListTile(
            leading: const Icon(Icons.email,color: Colors.blue,),
            title: new TextField(
              controller: cemail,
              decoration: new InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone,color: Colors.blue,),
            title: new TextField(
              controller: ctele ,
              decoration: new InputDecoration(
                hintText: "Numero de telephone",
              ),
            ),
          ),

          new ListTile(
            leading: const Icon(FontAwesomeIcons.stethoscope,
                color: Colors.blue, size: 16.0),
            title: new TextField(
              controller: cspe,
              decoration: new InputDecoration(
                hintText: "Spécialité",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          new ListTile(
            leading: const Icon(Icons.add_location,color: Colors.blue,),
            title: new TextField(
              controller: cadd,
              decoration: new InputDecoration(
                hintText: "Adresse",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.cyan[700]
            ),
            child: (
                new RaisedButton(
                  child: new Text("Modifier un docteur",style: TextStyle(fontSize: 17),),
                  color: Colors.tealAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  onPressed: (){
                    editDate();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context)=>Liste_Docteur()),
                    );
                  },
                )
            ),

          )],

      ),
    );
  }
}

Widget imageProfile(){
  return Center(
    child: Stack(children: <Widget>[

      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(
          'assets/images/doctor.png',
          width: 200,
          height: 150,
        ),
      ),
    ],),
  );
}