import 'package:flutter/material.dart';
import 'package:gestion_delegue/Pages-Admin/Delegue/Liste-Delegue.dart';
import 'package:http/http.dart' as http;


class Modifier_Delegue extends StatefulWidget{
  final List list;
  final int index;
  Modifier_Delegue({this.list,this.index});
  _Modifier_DelegueState createState()=> _Modifier_DelegueState();
}

class _Modifier_DelegueState extends State<Modifier_Delegue>{


  TextEditingController cnom = new TextEditingController();
  TextEditingController cprenom = new TextEditingController();
  TextEditingController cemail = new TextEditingController();
  TextEditingController ctele = new TextEditingController();
  TextEditingController cpass = new TextEditingController();

  void editDate() async{
    var url ="http://192.168.1.67:80/Admin/Delegue/Modifier_delegue.php";
    final response = await http.post(url,body:{
      "nom": cnom.text,
      "prenom":cprenom.text,
      "email":cemail.text,
      "Numero_tele":ctele.text,
      "password":cpass.text,
      "id":widget.list[widget.index]['id'],
    });
  }


  void initState(){
    cnom=TextEditingController(text: widget.list[widget.index]['nom']);
    cprenom=TextEditingController(text: widget.list[widget.index]['prenom']);
    cemail=TextEditingController(text: widget.list[widget.index]['email']);
    ctele=TextEditingController(text: widget.list[widget.index]['Numero_tele']);
    cpass=TextEditingController(text: widget.list[widget.index]['password']);
    super.initState();
  }


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title :Text("Modifier un délégue"),
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
            leading: const Icon(Icons.vpn_key,color: Colors.blue,),
            title: new TextField(
              controller: cpass,
              decoration: new InputDecoration(
                hintText: "Password",
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
                  child: new Text("Modifier un délégué",style: TextStyle(fontSize: 17),),
                  color: Colors.tealAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  onPressed: (){
                    editDate();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context)=>Liste_Delegue()),
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
          'assets/images/delegue.png',
          width: 200,
          height: 150,
        ),
      ),
    ],),
  );
}