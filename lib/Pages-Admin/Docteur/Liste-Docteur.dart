import 'package:flutter/material.dart';
import 'package:gestion_delegue/Authentification.dart';
import 'package:gestion_delegue/Pages-Admin/Dashboard.dart';
import 'package:gestion_delegue/Pages-Admin/Delegue/Ajouter-Delegue.dart';
import 'package:gestion_delegue/Pages-Admin/Delegue/Detail-Delegue.dart';
import 'package:gestion_delegue/Pages-Admin/Delegue/Liste-Delegue.dart';
import 'package:gestion_delegue/Pages-Admin/Docteur/Ajouter-Docteur.dart';
import 'package:gestion_delegue/Pages-Admin/Docteur/Detail-Docteur.dart';
import 'package:gestion_delegue/Pages-Admin/Medicament/Liste-Medicament.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Liste_Docteur extends StatelessWidget{
  final String nbreDoctor;
  final String nbreDelegue;
  final String nbreMedicament;
  final String Nom;
  final String Prenom;
  final String Email;

  Liste_Docteur({this.nbreDoctor=" ",this.nbreDelegue=" ",this.nbreMedicament=" ",this.Nom=" ",this.Prenom=" ",this.Email=" "});

  Future<List> getData() async{
    final response= await http.get("http://192.168.1.67:80/Admin/Docteur/Liste_docteur.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text('Liste des docteurs'),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.black), onPressed: null)

        ],
      ),
      drawer:  new Drawer(
        child:Column(
          children: <Widget>[
            //header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.tealAccent,
              child: Center(
                  child:Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 120,
                        margin: EdgeInsets.only(
                          top: 30,
                          bottom: 10,
                        ),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            image: new AssetImage('assets/images/delegue.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        Prenom+" "+Nom,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Niconne',
                        ),),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        Email,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),),
                    ],
                  )
              ),
            ) ,

            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Dashboard(nbreDoctor:nbreDoctor,nbreDelegue:nbreDelegue,nbreMedicament:nbreMedicament,Nom:Nom,Prenom:Prenom,Email:Email)),
                  );
                },
                child:ListTile(
                  title: Text('Tableau de board'),
                  leading: Icon(Icons.dashboard,color: Colors.blue,),
                )
            ),

            InkWell(
                child:ListTile(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context)=>Liste_Docteur(nbreDoctor:nbreDoctor,nbreDelegue:nbreDelegue,nbreMedicament:nbreMedicament,Nom:Nom,Prenom:Prenom,Email:Email)),
                    );
                  },
                  title: Text('Liste Docteur'),
                  leading: Icon(Icons.list,color: Colors.blue),
                )
            ),

            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Liste_Delegue(nbreDoctor:nbreDoctor,nbreDelegue:nbreDelegue,nbreMedicament:nbreMedicament,Nom:Nom,Prenom:Prenom,Email:Email)),
                  );
                },
                child:ListTile(
                  title: Text('Liste Delegué'),
                  leading: Icon(Icons.list,color: Colors.blue),
                )
            ),
            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Liste_Medicament(nbreDoctor:nbreDoctor,nbreDelegue:nbreDelegue,nbreMedicament:nbreMedicament,Nom:Nom,Prenom:Prenom,Email:Email)),
                  );
                },
                child:ListTile(
                  title: Text('liste Médicament'),
                  leading: Icon(Icons.list,color: Colors.blue),
                )
            ),
            Divider(),
            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Authentification()),
                  );
                },
                child:ListTile(
                  title: Text('Se Déconnecter'),
                  leading: Icon(Icons.exit_to_app,color: Colors.blue),
                )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context)=>Ajouter_Docteur(),
          ),
        ),
        child: Icon(Icons.add),
      ),

      body: FutureBuilder<List>(
          future:getData(),
          builder: (ctx,ss){
            if(ss.hasError){
              print("Error");
            }
            if(ss.hasData){
              return Items(list:ss.data);
            }else{
              return CircularProgressIndicator();
            }
          }
      ),
    );
  }
}
class Items extends StatelessWidget{
  List list;
  Items({this.list});
  Widget build(BuildContext context){
    return ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: list==null?0:list.length,
        itemBuilder: ( ctx,i) {
          return new Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),

            child: new ListTile(

              leading: ConstrainedBox(

                constraints: BoxConstraints(
                ),
                child: Image.asset("assets/images/doctor.png", fit: BoxFit.cover),
              ),
              title:Text(list[i]['nom']+" "+list[i]['prenom'],),
              subtitle: Text(list[i]['email']+"\n"+list[i]['Numero_tele'],),
              onTap: ()=>Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context)=>Detail_Docteur(list:list,index:i),
                ),
              ),
            ),
            color: Colors.white ,
            elevation: 1.0,
          );
        }
    );
  }
}