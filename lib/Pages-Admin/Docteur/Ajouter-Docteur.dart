import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_delegue/Pages-Admin/Docteur/Liste-Docteur.dart';
import 'package:http/http.dart' as http;



class Ajouter_Docteur extends StatefulWidget{
  _Ajouter_DocteurState createState() => _Ajouter_DocteurState();
}

class _Ajouter_DocteurState extends State<Ajouter_Docteur>{
  TextEditingController cnom = new TextEditingController();
  TextEditingController cprenom = new TextEditingController();
  TextEditingController cemail = new TextEditingController();
  TextEditingController ctele = new TextEditingController();
  TextEditingController cspe = new TextEditingController();
  TextEditingController cadd = new TextEditingController();

  void addData() async{
    var url ="http://192.168.1.67:80/Admin/Docteur/Ajouter_docteur.php";
    final response = await http.post(url,body:{
      "nom": cnom.text,
      "prenom":cprenom.text,
      "email":cemail.text,
      "Numero_tele":ctele.text,
      "specialite":cspe.text,
      "adresse":cadd.text,
    });
  }

  Widget build(BuildContext context){
    return Scaffold(

        appBar: new AppBar(
          backgroundColor: Colors.tealAccent,
          title: Text('Ajouter un docteur'),
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
              nomTextField(),
              SizedBox(
                height: 8,
              ),
              prenomTextField(),
              SizedBox(
                height: 8,
              ),
              emailTextField(),
              SizedBox(
                height: 8,
              ),
              teleTextField(),
              SizedBox(
                height: 8,
              ),
              speTextField(),
              SizedBox(
                height: 8,
              ),

              addTextField(),
              SizedBox(
                height: 12,
              ),

              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.cyan[700]
                ),
                child: (
                    new RaisedButton(
                      child: new Text("Ajouter un docteur",style: TextStyle(fontSize: 17),),
                      color: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: (){
                        addData();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context)=>Liste_Docteur()),
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
          'assets/images/doctor.png',
          width: 200,
          height: 140,
        ),
      ),
    ],),
  );
}

Widget nomTextField(){
  return TextFormField(
    controller: cnom,
    decoration: InputDecoration(
      border:OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.tealAccent,
          )
      ),
      prefixIcon: Icon(
        Icons.person,
        color: Colors.blue,
      ),

      labelText: "Nom",
      hintText: "Nom",
    ),

  );
}

Widget prenomTextField(){
  return TextFormField(
    controller: cprenom,
    decoration: InputDecoration(
      border:OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.tealAccent,
          )
      ),
      prefixIcon: Icon(
        Icons.person,
        color: Colors.blue,
      ),
      labelText: "Prénom",
      hintText: "Prénom",
    ),
  );
}


Widget emailTextField(){
  return TextFormField(
    controller: cemail,
    decoration: InputDecoration(
      border:OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.tealAccent,
          )
      ),
      prefixIcon: Icon(
        Icons.email,
        color: Colors.blue,
      ),
      labelText: "Email",
      hintText: "Email",
    ),
  );
}


Widget teleTextField(){
  return TextFormField(
    controller: ctele,
    decoration: InputDecoration(
      border:OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.tealAccent,
          )
      ),
      prefixIcon: Icon(
        Icons.phone,
        color: Colors.blue,
      ),
      labelText: "Numéro de téléphone",
      hintText: "Numéro de téléphone",
    ),
  );
}

Widget speTextField(){
  return TextFormField(
    controller: cspe,
    decoration: InputDecoration(
      border:OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.tealAccent,
          )
      ),
      prefixIcon: Icon(
          FontAwesomeIcons.stethoscope,
          color: Colors.blue, size: 16.0,
      ),
      labelText: "Spécialité",
      hintText: "Spécialité ",
    ),
  );
}

  Widget addTextField(){
    return TextFormField(
      controller: cadd,
      decoration: InputDecoration(
        border:OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.tealAccent,
            )
        ),
        prefixIcon: Icon(
          Icons.location_on,
          color: Colors.blue,
        ),
        labelText: "Adresse",
        hintText: "Adresse",
      ),
    );
  }



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