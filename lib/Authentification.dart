import 'dart:convert';
import 'package:gestion_delegue/Pages-Admin/Dashboard.dart';
import 'package:gestion_delegue/Pages_Delegue/Dashbord.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';



class Authentification extends StatefulWidget {
  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {

  bool _ishiden=true;

  void _toggleVisibility(){
    setState(() {
      _ishiden = !_ishiden;
    });
  }

  final formKey=new GlobalKey<FormState>();

  String _Email;
  String _Password;
  String nbreDoctor;
  String nbreDelegue;
  String nbreMedicament;
  String Nom;
  String Prenom;
  String Email;


  String nbreRapport;
  String nbreVoyage;
  String nbreRendez;
  String nbreCommande;


  Future<void> valider() async{

    final form=formKey.currentState;
    form.save();
    final response = await http.post("http://192.168.1.67:80/login.php",body:{
      "Email":'$_Email',
      "Password":'$_Password',
    });


    var data =JsonDecoder().convert(response.body);

    if(data == "Success"){
      getData();
    }else{
      Fluttertoast.showToast(
          msg: "mot de passe ou email est incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


  void getData() async{
    final response = await http.post("http://192.168.1.67:80/Admin/Info_Admin.php",body:{
      "email":'$_Email',
    });
    var data =JsonDecoder().convert(response.body);
    Nom=data[0][0]['nom'];

    Prenom=data[0][0]['prenom'];
    Email=data[0][0]["email"];


    nbreDoctor=data[1];
    nbreDelegue=data[2];
    nbreMedicament=data[3];

    nbreRapport=data[4];
    nbreCommande=data[5];
    nbreVoyage=data[6];
    nbreRendez=data[7];

    if(data[0][0]["compte"]=="Delegue"){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard_Delegue(nbreRapport:nbreRapport,nbreVoyage:nbreVoyage,nbreRendez:nbreRendez,nbreCommande:nbreCommande,Nom:Nom,Prenom:Prenom,Email:Email)));
    }
    else if(data[0][0]["compte"]=="Admin"){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(nbreDoctor:nbreDoctor,nbreDelegue:nbreDelegue,nbreMedicament:nbreMedicament,Nom:Nom,Prenom:Prenom,Email:Email)));
    }
  }

//  void getStatistique() async{
//    final response = await http.post("http://192.168.43.145:80/Admin/Dashboard.php",body:{
//    'Email':'$_Email',
//    });
//    var data =JsonDecoder().convert(response.body);
//    nbreDoctor=data[0];
//    nbreDelegue=data[1];
//    nbreMedicament=data[2];
//    nbreRapport=data[3];
//    nbreCommande=data[4];
//    nbreVoyage=data[5];
//    nbreRendez=data[6];
//  }

//  void getStatistiqueDelegue() async{
//    final response = await http.post("http://192.168.43.145:80/Delegue/Dashboard.php",body:{
//      'Email':'$_Email',
//    });
//    var data =JsonDecoder().convert(response.body);
//    nbreRapport=data[0];
//    nbreCommande=data[1];
//    nbreVoyage=data[2];
//    nbreRendez=data[3];
//  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.tealAccent,
                  Colors.tealAccent,
                  Colors.tealAccent
                ]
            )
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 90,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text("Délégués-Médicaux",  style: TextStyle(color: Colors.blue, fontSize: 40, fontFamily: 'Niconne',),),

                ],
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        Container(
                          decoration: BoxDecoration(
//                              color: Colors.white,
//                              borderRadius: BorderRadius.circular(10),
//                              boxShadow: [BoxShadow(
//                                  color: Color.fromRGBO(225, 95, 27, .3),
//                                  blurRadius: 20,
//                                  offset: Offset(0, 10)
//                              )]
                          ),
                          child:new Form(
                            key:formKey,
                            child: new Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
//                                decoration: BoxDecoration(
//                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
//                                ),

                                  child: TextFormField(

                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(30),

                                        ),

                                      ),
                                      focusedBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.cyan),
                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                      ),

                                      prefixIcon: Icon(Icons.email,color: Colors.blue),
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),

                                    ),

                                    onSaved:(value)=>_Email=value,


                                  ),

                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
//                                decoration: BoxDecoration(
//                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
//                                ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(30),
                                        ),
                                      ),
                                      focusedBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blue),
                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                      ),
                                      prefixIcon: Icon(Icons.lock_open,color: Colors.blue),
                                      suffixIcon: IconButton(
                                          onPressed:()=> _toggleVisibility(),
                                          icon: _ishiden ? Icon(Icons.visibility_off,color: Colors.blue,) :  Icon(Icons.visibility,color: Colors.blue,),
                                      ),
                                      hintText: "Mot de passe",
                                      hintStyle: TextStyle(color: Colors.grey),

                                    ),
                                    obscureText: _ishiden,
                                    onSaved:(value)=>_Password=value,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),
                        SizedBox(height: 40,),
                        Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 30,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue[700]
                          ),
                          child: (
                              new RaisedButton(
                                child: new Text("Login",),
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                                onPressed: valider,
                              )
                          ),

                        )],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}