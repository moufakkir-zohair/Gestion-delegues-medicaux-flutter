import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_delegue/Pages-Admin/Medicament/Liste-Medicament.dart';
import 'package:http/http.dart' as http;



class Ajouter_Medicament extends StatefulWidget{
  _Ajouter_MedicamentState createState() => _Ajouter_MedicamentState();
}

class _Ajouter_MedicamentState extends State<Ajouter_Medicament>{

  TextEditingController ccode = new TextEditingController();
  TextEditingController cnom = new TextEditingController();
  TextEditingController cdate= new TextEditingController();
  TextEditingController cquantite = new TextEditingController();
  TextEditingController cprix= new TextEditingController();

  void addData() async{
    var url ="http://192.168.1.67:80/Admin/Medicament/Ajouter_medicament.php";
    final response = await http.post(url,body:{
      "Code": ccode.text,
      "Nom_medi":cnom.text,
      "Date_Exp":cdate.text,
      "Quantite":cquantite.text,
      "Prix":cprix.text,
      "documentation":"NULL",
    });
  }

  Widget build(BuildContext context){
    return Scaffold(

        appBar: new AppBar(
          backgroundColor: Colors.tealAccent,
          title: Text('Ajouter un médicament'),
          centerTitle: true,
        ),


        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: ListView(
            children: <Widget>[
              imageProfile(),
              SizedBox(
                height: 2,
              ),
              codeTextField(),
              SizedBox(
                height: 8,
              ),
             nomTextField(),
              SizedBox(
                height: 8,
              ),
              dateTextField(),
              SizedBox(
                height: 8,
              ),
              quantiteTextField(),
              SizedBox(
                height: 8,
              ),
              prixTextField(),
              SizedBox(
                height: 8,
              ),
//
//              addTextField(),
//              SizedBox(
//                height: 12,
//              ),

              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.cyan[700]
                ),
                child: (
                    new RaisedButton(
                      child: new Text("Ajouter un médicament",style: TextStyle(fontSize: 17),),
                      color: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: (){
                       // addData();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context)=>Liste_Medicament()),
                        );
                      },
                    )
                ),

              )



            ],
          ),
        )
    );
  }

Widget imageProfile(){
  return Center(
    child: Stack(children: <Widget>[

      Padding(
        padding: const EdgeInsets.all(0.0),
        child: Image.asset(
          'assets/images/medicament.png',
          width: 200,
          height: 140,
        ),
      ),
    ],),
  );
}

Widget codeTextField(){
  return ListTile(
    leading: Text("Code       :  ", style: TextStyle(fontSize: 16),),
    title: new TextField(
      controller: ccode,
      decoration: new InputDecoration(
        hintText: "Code",
      ),
    ),
  );
}

Widget nomTextField(){
    return ListTile(
      leading: Text("Nom       :  ", style: TextStyle(fontSize: 16),),
      title: new TextField(
        controller: cnom,
        decoration: new InputDecoration(
          hintText: "Nom",
        ),
      ),
    );
}
//
//
Widget dateTextField(){
  return ListTile(
      leading: Text("Date        : ", style: TextStyle(fontSize: 16),),
      title: new TextField(
      controller: cdate,
      decoration: new InputDecoration(
      hintText: "yyyy-mm-dd HH:mm",
      ),
  ),
  );
  }
//
//
Widget quantiteTextField(){
  return ListTile(
    leading: Text("Quantité :", style: TextStyle(fontSize: 16),),
    title: new TextField(
      controller: cquantite,
      decoration: new InputDecoration(
        hintText: "Quantité",
      ),
    ),
  );
}
//
Widget prixTextField(){
  return ListTile(
    leading: Text("Prix         : ", style: TextStyle(fontSize: 16),),
    title: new TextField(
      controller: cprix,
      decoration: new InputDecoration(
        hintText: "Prix",
      ),
    ),
  );
}
//
//  Widget addTextField(){
//    return TextFormField(
//      controller: cadd,
//      decoration: InputDecoration(
//        border:OutlineInputBorder(
//            borderSide: BorderSide(
//              color: Colors.tealAccent,
//            )
//        ),
//        prefixIcon: Icon(
//          Icons.location_on,
//          color: Colors.blue,
//        ),
//        labelText: "Adresse",
//        hintText: "Adresse",
//      ),
//    );
//  }



Widget _myAppBar3() {
  return Container(
    height: 80.0,
    //width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.cyan,
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
                        color: Colors.white,
                      ),
                      onPressed: () {

//                        Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (BuildContext context)=>MyAccountsPage(),
//                          ),
//                        );

                      }),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Text(
                    'Détail de délégué ',
                    style: TextStyle(
                      color: Colors.white,
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