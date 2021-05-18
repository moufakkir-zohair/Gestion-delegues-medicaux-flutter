import 'package:flutter/material.dart';
import 'package:gestion_delegue/Pages-Admin/Medicament/Liste-Medicament.dart';
import 'package:http/http.dart' as http;

class Modifier_Medicament extends StatefulWidget{
  final List list;
  final int index;
  Modifier_Medicament({this.list,this.index});
  _Modifier_MedicamentState createState()=> _Modifier_MedicamentState();
}

class _Modifier_MedicamentState extends State<Modifier_Medicament>{
  TextEditingController cnom = new TextEditingController();
  TextEditingController cdate= new TextEditingController();
  TextEditingController cquantite = new TextEditingController();
  TextEditingController cprix= new TextEditingController();

  void editDate() async{
    var url ="http://192.168.1.67:80/Admin/Medicament/Modifier_medicament.php";
    final response = await http.post(url,body:{
      "Nom_medi":cnom.text,
      "Date_Exp":cdate.text,
      "Quantite":cquantite.text,
      "Prix":cprix.text,
      "Code":widget.list[widget.index]['Code'],
    });
  }


  void initState(){
  cnom=TextEditingController(text: widget.list[widget.index]['Nom_medi']);
  cdate=TextEditingController(text: widget.list[widget.index]['Date_Exp']);
  cquantite=TextEditingController(text: widget.list[widget.index]['Quantite']);
  cprix=TextEditingController(text: widget.list[widget.index]['Prix']);
    super.initState();
  }


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title :Text("Modifier médicament"),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body:ListView(
        children: <Widget>[
          imageProfile(),



          new ListTile(
            leading: Text("Nom       :  ", style: TextStyle(fontSize: 16),),
            title: new TextField(
              controller: cnom,
              decoration: new InputDecoration(
                hintText: "Nom",
              ),
            ),
          ),


          new ListTile(
            leading: Text("Date        : ", style: TextStyle(fontSize: 16),),
            title: new TextField(
              controller: cdate,
              onTap: () {
                final dtPick=showDatePicker(
                    context: context,
                    initialDate: new DateTime.now(),
                    firstDate: new DateTime(2020),
                    lastDate: new DateTime(2100));
                print(dtPick);
                if(dtPick != null ){

                    new Text(dtPick.toString());

                }
               },

              decoration: new InputDecoration(
                hintText: "Nom",
              ),
            ),
          ),


          new ListTile(
            leading: Text("Quantité :", style: TextStyle(fontSize: 16),),
            title: new TextField(
              controller: cquantite,
              decoration: new InputDecoration(
                hintText: "Nom",
              ),
            ),
          ),



          new ListTile(
            leading: Text("Prix         : ", style: TextStyle(fontSize: 16),),
            title: new TextField(
              controller: cprix,
              decoration: new InputDecoration(
                hintText: "Prix",
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
                  child: new Text("Modifier médicament",style: TextStyle(fontSize: 17),),
                  color: Colors.tealAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  onPressed: (){
                    editDate();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context)=>Liste_Medicament()),
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
          'assets/images/medicament.png',
          width: 200,
          height: 150,
        ),
      ),
    ],),
  );
}