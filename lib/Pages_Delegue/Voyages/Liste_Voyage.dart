import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_delegue/Authentification.dart';
import 'package:gestion_delegue/Pages_Delegue/Commande/Liste_Commande.dart';
import 'package:gestion_delegue/Pages_Delegue/Dashbord.dart';
import 'package:gestion_delegue/Pages_Delegue/Rapport/Liste_Rapport.dart';
import 'package:gestion_delegue/Pages_Delegue/Rendez_Vous/Liste_Rendez.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Liste_Voyage extends StatelessWidget{

  final String Nom;
  final String Prenom;
  final String Email;

  final String nbreRapport;
  final String nbreVoyage;
  final String nbreRendez;
  final String nbreCommande;


  Liste_Voyage({this.nbreRapport=" ",this.nbreVoyage=" ",this.nbreRendez=" ",this.nbreCommande=" ",this.Nom,this.Prenom,this.Email});

  Future<List> getData() async{
    final response= await http.get("http://192.168.1.67:80/Delegue/Liste_voyage.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text('Liste des voyages'),
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
                    MaterialPageRoute(builder: (BuildContext context)=>Dashboard_Delegue(nbreRapport:nbreRapport,nbreVoyage:nbreVoyage,nbreRendez:nbreRendez,nbreCommande:nbreCommande,Nom:Nom,Prenom:Prenom,Email:Email)),
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
                      MaterialPageRoute(builder: (BuildContext context)=>Liste_Rendez(nbreRapport:nbreRapport,nbreVoyage:nbreVoyage,nbreRendez:nbreRendez,nbreCommande:nbreCommande,Nom:Nom,Prenom:Prenom,Email:Email)),
                    );
                  },
                  title: Text('Liste des rendez-vous'),
                  leading: Icon(Icons.date_range,color: Colors.blue),
                )
            ),

            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Liste_Rapport(nbreRapport:nbreRapport,nbreVoyage:nbreVoyage,nbreRendez:nbreRendez,nbreCommande:nbreCommande,Nom:Nom,Prenom:Prenom,Email:Email)),
                  );
                },
                child:ListTile(
                  title: Text('Liste des rapport'),
                  leading:  Icon(FontAwesomeIcons.edit,
                      color: Colors.blue, size: 16.0),
                )
            ),
            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Liste_Voyage(nbreRapport:nbreRapport,nbreVoyage:nbreVoyage,nbreRendez:nbreRendez,nbreCommande:nbreCommande,Nom:Nom,Prenom:Prenom,Email:Email)),
                  );
                },
                child:ListTile(
                  title: Text('Liste des voyages'),
                  leading: Icon(FontAwesomeIcons.plane,
                      color: Colors.blue, size: 16.0),
                )
            ),

            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Liste_Commande(nbreRapport:nbreRapport,nbreVoyage:nbreVoyage,nbreRendez:nbreRendez,nbreCommande:nbreCommande,Nom:Nom,Prenom:Prenom,Email:Email)),
                  );
                },
                child:ListTile(
                  title: Text('Liste des commandes'),
                  leading: Icon(FontAwesomeIcons.list,
                      color: Colors.blue, size: 16.0),
                )
            ),


            Divider(
              //height: 64,
              thickness: 3,
              color: Colors.tealAccent,
              indent: 16,
              endIndent: 15,
            ),
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
                child: Image.asset("assets/images/voyage.png", fit: BoxFit.cover),
              ),
              title:Text(list[i]['ville_d']+"-"+list[i]['ville_a'], style: TextStyle(color: Colors.blue, fontSize: 17),),
              subtitle: Text("Date de départ: "+list[i]['date_d']+"\nVille d'arrivée: "+list[i]['ville_a']+"\nDate d'arrivée: "+list[i]['date_a']),
//              onTap: ()=>Navigator.of(context).push(
//                MaterialPageRoute(
//                  builder: (BuildContext context)=>Detail_Rendez(list:list,index:i),
//                ),
//              ),
            ),
            color: Colors.white ,
            elevation: 1.0,
          );
        }
    );
  }
}